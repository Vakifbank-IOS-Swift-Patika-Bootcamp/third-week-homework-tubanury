//
//  KeeperAnimalListViewController.swift
//  ZooApp
//
//  Created by Tuba N. Yıldız on 20.11.2022.
//

import UIKit

class KeeperAnimalListViewController: UIViewController {

    var zoo: wildZoo?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
}


extension KeeperAnimalListViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        zoo?.zooKeepers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return zoo?.zooKeepers[section].animals.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let _ = zoo?.zooKeepers {
            if let animals = zoo?.zooKeepers[indexPath.section].animals{
                let cellText = animals[indexPath.row].specie
                let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
                cell.textLabel?.text = cellText
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < zoo?.zooKeepers.count ?? 0 {
            if let data = zoo?.zooKeepers{
                return data[section].name + "'s Animals"

            }
        }
        return nil
    }
    
}

