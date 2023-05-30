//
//  MainScreenPresenter.swift
//  Kind
//
//  Created by Damir on 29.05.2023.
//

import Foundation

protocol MainScreenPresenter: AnyObject {
    func viewDidLoad()
    func numberOfItems() -> Int
    func item(at index: Int) -> ActOfKindness
}

final class MainScreenPresenterImpl {
    weak var view: MainScreenView?
    var coordinator: MainScreenCoordinator?
    
    private var items: [ActOfKindness] = []
    
    init() {
        // Добавьте ваш список актов доброты в items
        items = RealmManager.shared.getAllActsOfKindness()
    }
}

private extension MainScreenPresenter {
    
}

// MARK: - MainScreenPresenter

extension MainScreenPresenterImpl: MainScreenPresenter {
    func viewDidLoad() {
        view?.reloadData()
    }
    
    func numberOfItems() -> Int {
        return items.count
    }
    
    func item(at index: Int) -> ActOfKindness {
        return items[index]
    }
}
