//
//  BasePresenter.swift
//  Kind
//
//  Created by Damir on 29.05.2023.
//

protocol BasePresenter {
    func viewDidLoad()
}

class BasePresenterImpl: BasePresenter {
    func viewDidLoad() {
        print("view did load")
    }
}

