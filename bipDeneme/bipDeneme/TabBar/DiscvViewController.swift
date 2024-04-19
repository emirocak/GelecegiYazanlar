import UIKit

struct ListItem {
    let image: UIImage
    let title: String
}

class DiscvViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: CustomFlowLayout())
    let altCollectionView = UICollectionView(frame: .zero, collectionViewLayout: CustomFlowLayout())
    let secondAltCollectionView = UICollectionView(frame: .zero, collectionViewLayout: CustomFlowLayout()) // Yeni alt koleksiyon görünümü
    
    let listeItems: [ListItem] = [
        ListItem(image: UIImage(named: "ceza")!, title: "Öğe 1"),
        ListItem(image: UIImage(named: "sago")!, title: "Öğe 2"),
        ListItem(image: UIImage(named: "ceza")!, title: "Öğe 1"),
        ListItem(image: UIImage(named: "sago")!, title: "Öğe 2"),
        
    
    ]
    
    let altListeItems: [ListItem] = [
        ListItem(image: UIImage(named: "ceza")!, title: "Öğe 1"),
        ListItem(image: UIImage(named: "sago")!, title: "Öğe 2"),
        ListItem(image: UIImage(named: "ceza")!, title: "Öğe 1"),
        ListItem(image: UIImage(named: "sago")!, title: "Öğe 2"),
    ]
    
    let secondAltListeItems: [ListItem] = [
        ListItem(image: UIImage(named: "ceza")!, title: "Öğe 1"),
        ListItem(image: UIImage(named: "ceza")!, title: "Öğe 1"),
        ListItem(image: UIImage(named: "sago")!, title: "Öğe 2"),
        ListItem(image: UIImage(named: "sago")!, title: "Öğe 2"),
    ]
    
    let titleLabel = UILabel() // Başlık Label'ını burada tanımlayın
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = "Keşfet"
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = UIColor.black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        let searchIcon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        searchIcon.tintColor = UIColor.black
        searchIcon.contentMode = .scaleAspectFit
        searchIcon.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchIcon)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchIcon.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            searchIcon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchIcon.widthAnchor.constraint(equalToConstant: 24),
            searchIcon.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        view.addSubview(collectionView)
        
        altCollectionView.delegate = self
        altCollectionView.dataSource = self
        altCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "AltCell")
        view.addSubview(altCollectionView)
        
        secondAltCollectionView.delegate = self
        secondAltCollectionView.dataSource = self
        secondAltCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "SecondAltCell")
        view.addSubview(secondAltCollectionView)
        configureConstraints()
        
        view.backgroundColor = UIColor.systemGray6
    }
    
    func configureConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        altCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            altCollectionView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            altCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            altCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            altCollectionView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        secondAltCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondAltCollectionView.topAnchor.constraint(equalTo: altCollectionView.bottomAnchor, constant: 20),
            secondAltCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            secondAltCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            secondAltCollectionView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return listeItems.count
        } else if collectionView == altCollectionView {
            return altListeItems.count
        } else if collectionView == secondAltCollectionView {
            return secondAltListeItems.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionViewCell
            let item = listeItems[indexPath.item]
            cell.configure(with: item)
            return cell
        } else if collectionView == altCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AltCell", for: indexPath) as! CustomCollectionViewCell
            let item = altListeItems[indexPath.item]
            cell.configure(with: item)
            return cell
        } else if collectionView == secondAltCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondAltCell", for: indexPath) as! CustomCollectionViewCell
            let item = secondAltListeItems[indexPath.item]
            cell.configure(with: item)
            return cell
        }
        return UICollectionViewCell()
    }
}

class CustomCollectionViewCell: UICollectionViewCell {
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(itemImageView)
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            itemImageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -8),
            
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with item: ListItem) {
        itemImageView.image = item.image
        titleLabel.text = item.title
    }
}

class CustomFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        let availableWidth = collectionView.bounds.inset(by: collectionView.layoutMargins).width
        let minColumnWidth = CGFloat(150)
        let maxNumColumns = Int(availableWidth / minColumnWidth)
        let cellWidth = (availableWidth / CGFloat(maxNumColumns)).rounded(.down)
        
        itemSize = CGSize(width: cellWidth, height: cellWidth)
        sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        minimumInteritemSpacing = 0
        minimumLineSpacing = 8
        
        scrollDirection = .horizontal
    }
}
