//
//  StoryViewController.swift
//  bipDeneme
//
//  Created by Emir OCAK on 18.04.2024.
//

import UIKit

class StoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var callLabel: UILabel!
    
        
        let list = [
            ("Durum", "download")
        ]
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return list.count}
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let (title, imageName) = list[indexPath.row]
            cell.textLabel?.text = title
            cell.imageView?.image = UIImage(named: "download")
            cell.textLabel?.textAlignment = .center
            cell.contentView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
            let customFont = UIFont.systemFont(ofSize: 16, weight: .bold)
            cell.textLabel?.font = customFont
            let imageView = UIImageView(image: UIImage(systemName: "ellipsis"))
            cell.accessoryView = imageView
            return cell
        }
        override func viewDidLoad() {
            super.viewDidLoad()  
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
