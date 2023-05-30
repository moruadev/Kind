//
//  RealmManager.swift
//  Kind
//
//  Created by Damir on 29.05.2023.
//

import Foundation
import RealmSwift

final class RealmManager {
    static let shared = RealmManager()
    
    let realm: Realm
    
    private init() {
        // Приватный инициализатор для предотвращения создания экземпляров извне
        do {
            realm = try Realm()
        } catch {
            fatalError("Failed to initialize Realm: \(error)")
        }
    }
    
    // MARK: - Public Methods
    
    func getAllActsOfKindness() -> [ActOfKindness] {
        let acts = realm.objects(ActOfKindness.self)
        return Array(acts)
    }
    
    func getCompletedActsOfKindness() -> [ActOfKindness] {
        let completedActs = realm.objects(ActOfKindness.self).filter("isCompleted = true")
        return Array(completedActs)
    }
    
    func getFutureTaskActsOfKindness() -> [ActOfKindness] {
        let futureTaskActs = realm.objects(ActOfKindness.self).filter("isFutureTask = true")
        return Array(futureTaskActs)
    }
    
    func updateActOfKindness(_ act: ActOfKindness, withCompletionStatus isCompleted: Bool) {
        do {
            try realm.write {
                act.isCompleted = isCompleted
            }
        } catch {
            print("Failed to update ActOfKindness: \(error)")
        }
    }
    
    func updateActOfKindness(_ act: ActOfKindness, withFutureTaskStatus isFutureTask: Bool) {
        do {
            try realm.write {
                act.isFutureTask = isFutureTask
            }
        } catch {
            print("Failed to update ActOfKindness: \(error)")
        }
    }
    
    // Метод для получения случайного акта доброты
    func getRandomActOfKindness() -> ActOfKindness? {
        let acts = realm.objects(ActOfKindness.self)
        let randomIndex = Int.random(in: 0..<acts.count)
        return acts[randomIndex]
    }
    
    // Дополнительные методы работы с базой данных Realm могут быть добавлены здесь
    
}

