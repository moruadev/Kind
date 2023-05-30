//import UIKit
//import SnapKit
//
//struct Item {
//    let title: String
//}
//
//class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    private let collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.backgroundColor = .clear
//        collectionView.showsVerticalScrollIndicator = false
//        collectionView.register(ButtonCell.self, forCellWithReuseIdentifier: "ButtonCell")
//        return collectionView
//    }()
//
//    private var items: [Item] = [] // Здесь можно задать ваш список актов доброты
//    private let backgroundImageView = UIImageView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupBackgroundImageView()
//        setupCollectionView()
//        setupData()
//    }
//
//    private func setupBackgroundImageView() {
//        view.addSubview(backgroundImageView)
//        backgroundImageView.image = UIImage(named: "background_image") // Замените на вашу фоновую картинку
//        backgroundImageView.contentMode = .scaleAspectFill
//
//        backgroundImageView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//    }
//
//    private func setupCollectionView() {
//        collectionView.dataSource = self
//        collectionView.delegate = self
//
//        collectionView.isPagingEnabled = true
//        view.addSubview(collectionView)
//
//        collectionView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//    }
//
//    private func setupData() {
//        // Добавьте ваш список актов доброты в items
//        items = [
//            Item(title: "This is a long text that contains more words. It demonstrates how the label can accommodate a larger amount of text. You can customize the font size and other properties according to your needs."),
//            Item(title: "This is a long text that contains more words. It demonstrates how the label can accommodate a larger amount of text. You can customize the font size and other properties according to your needs."),
//            Item(title: "This is a long text that contains more words. It demonstrates how the label can accommodate a larger amount of text. You can customize the font size and other properties according to your needs."),
//            // ...
//        ]
//        collectionView.reloadData()
//    }
//
//    // MARK: - UICollectionViewDataSource
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return items.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonCell", for: indexPath) as! ButtonCell
//        cell.configure(with: items[indexPath.item])
//        return cell
//    }
//
//    // MARK: - UICollectionViewDelegateFlowLayout
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = UIScreen.main.bounds.width
//        return CGSize(width: width, height: collectionView.bounds.height)
//    }
//}
//
//class ButtonCell: UICollectionViewCell {
//    let titleLabel = UILabel()
//    private let button1 = UIButton()
//    private let button2 = UIButton()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        contentView.addSubview(titleLabel)
//
//        titleLabel.textColor = .white // Покраска текста в белый цвет
//        titleLabel.textAlignment = .center
//        titleLabel.font = UIFont.systemFont(ofSize: 24)
//        titleLabel.numberOfLines = 0
//        backgroundColor = .clear
//
//        button1.setImage(UIImage(systemName: "heart.fill"), for: .normal)
//        button1.tintColor = .white
//        button1.imageView?.contentMode = .scaleAspectFit
//        button1.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//
//        button2.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
//        button2.tintColor = .white
//        button2.imageView?.contentMode = .scaleAspectFit
//        button2.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//
//        button1.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
//        button2.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside)
//
//        setupConstraints()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setupConstraints() {
//        titleLabel.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.leading.trailing.equalToSuperview().inset(16)
//        }
//
//        let stackView = UIStackView(arrangedSubviews: [button1, button2])
//        stackView.axis = .horizontal
//        stackView.spacing = 8
//
//        contentView.addSubview(stackView)
//
//        stackView.snp.makeConstraints { make in
//            make.top.equalTo(titleLabel.snp.bottom).offset(16)
//            make.centerX.equalToSuperview()
//        }
//
//        button1.snp.makeConstraints { make in
//            make.size.equalTo(40)
//        }
//
//        button2.snp.makeConstraints { make in
//            make.size.equalTo(40)
//        }
//    }
//
//    func configure(with item: Item) {
//        titleLabel.text = item.title
//    }
//
//    @objc private func button1Tapped() {
//        print("Favorite") // Вместо этого вывода может быть нужная вам логика
//    }
//
//    @objc private func button2Tapped() {
//        print("Share") // Вместо этого вывода может быть нужная вам логика
//    }
//}
