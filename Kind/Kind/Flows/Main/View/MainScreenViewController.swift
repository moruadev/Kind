//
//  MainScreenViewController.swift
//  Kind
//
//  Created by Damir on 29.05.2023.
//

import UIKit
import SnapKit

protocol MainScreenView: AnyObject {
    func reloadData()
}

final class MainScreenViewController: UIViewController {
    var presenter: MainScreenPresenter!
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(ButtonCell.self, forCellWithReuseIdentifier: "ButtonCell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .link
        presenter.viewDidLoad()
        setupCollectionView()
    }
}

private extension MainScreenViewController {
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.isPagingEnabled = true
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - MainScreenView

extension MainScreenViewController: MainScreenView {
    func reloadData() {
        collectionView.reloadData()
    }
}

// MARK: - UICOllectionViewDataSource

extension MainScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonCell", for: indexPath) as! ButtonCell
        let item = presenter.item(at: indexPath.item)
        cell.configure(with: item)
        return cell
    }
    
    // Переиспользуем ячейки
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let buttonCell = cell as? ButtonCell else { return }
        buttonCell.prepareForReuse()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MainScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: width, height: collectionView.bounds.height)
    }
}

