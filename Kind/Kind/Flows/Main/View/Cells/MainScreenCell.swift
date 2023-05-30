//
//  MainScreenCell.swift
//  Kind
//
//  Created by Damir on 29.05.2023.
//

import UIKit
import SnapKit

class ButtonCell: UICollectionViewCell {
    let titleLabel = UILabel()
    private let button1 = UIButton()
    private let button2 = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(titleLabel)
        
        titleLabel.textColor = .white // Покраска текста в белый цвет
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 30)
        titleLabel.numberOfLines = 0
        backgroundColor = .clear
        
        button1.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        button1.tintColor = .white
        button1.imageView?.contentMode = .scaleAspectFit
        button1.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        button2.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button2.tintColor = .white
        button2.imageView?.contentMode = .scaleAspectFit
        button2.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        button1.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        button2.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside)
        
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        let stackView = UIStackView(arrangedSubviews: [button1, button2])
        stackView.axis = .horizontal
        stackView.spacing = 8
        
        contentView.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        button1.snp.makeConstraints { make in
            make.size.equalTo(40)
        }
        
        button2.snp.makeConstraints { make in
            make.size.equalTo(40)
        }
    }
    
    func configure(with item: ActOfKindness) {
        titleLabel.text = item.enTitle
    }
    
    @objc private func button1Tapped() {
        print("Favorite") // Вместо этого вывода может быть нужная вам логика
        
        print(RealmManager.shared.getAllActsOfKindness())
    }
    
    @objc private func button2Tapped() {
        print("Share") // Вместо этого вывода может быть нужная вам логика
        
        print(RealmManager.shared.getRandomActOfKindness())
    }
}
