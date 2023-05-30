//
//  MainScreenFactory.swift
//  Kind
//
//  Created by Damir on 29.05.2023.
//

import Foundation

enum MainScreenFactory {
    static func create() -> MainScreenViewController {
        let presenter = MainScreenPresenterImpl()
        let view = MainScreenViewController()
        let coordinator = MainScreenCoordinatorImpl()
        
        view.presenter = presenter
        presenter.view = view
        presenter.coordinator = coordinator
        
        return view
    }
}
