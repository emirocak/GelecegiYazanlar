import UIKit

class MoreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    let list = [
        ("Kanallar", "gearshape"),
        ("Oyunlar", "gearshape"),
        ("Dijital Varlık", "gearshape"),
        ("Paycell", "gearshape"),
        ("Kişi Listesi", "gearshape"),
        ("Tuş Takımı", "gearshape"),
        ("Kamera", "gearshape"),
        ("Acil Durum", "gearshape"),
        ("Yıldızlı Mesajlar", "gearshape")
    ]
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let (title, systemImageName) = list[indexPath.row]
        cell.textLabel?.text = title
        cell.imageView?.image = UIImage(systemName: systemImageName)
        tableView.separatorInset = UIEdgeInsets(top: 24, left: 16, bottom: 48, right: 0)
        let customFont = UIFont.systemFont(ofSize: 16, weight: .bold)
        UILabel.appearance().font = customFont
        return cell
    }

        
       
       

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}
