//
//  ActOfKindness.swift
//  Kind
//
//  Created by Damir on 29.05.2023.
//

import Foundation
import RealmSwift
import Realm

class ActOfKindness: Object {
    @objc dynamic var id: ObjectId = ObjectId.generate()
    @objc dynamic var enTitle: String = ""
    @objc dynamic var ruTitle: String = ""
    @objc dynamic var isCompleted = false
    @objc dynamic var isFutureTask = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(enTitle: String, ruTitle: String, isCompleted: Bool, isFutureTask: Bool) {
        self.init()
        self.enTitle = enTitle
        self.ruTitle = ruTitle
        self.isCompleted = isCompleted
        self.isFutureTask = isFutureTask
    }
}


