//
//  EmployeesTableViewController.swift
//  CompanyApp
//
//  Created by Tuba N. Yıldız on 19.11.2022.
//

import UIKit

class EmployeesTableViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var employeesTableView: UITableView!
    
    var company: SoftwareCompany?
    var filteredData: [Employee]?

    override func viewDidLoad() {
        super.viewDidLoad()

        employeesTableView.dataSource = self
        employeesTableView.delegate = self
        searchBar.delegate = self
        filteredData = company?.getEmployees()
        // Do any additional setup after loading the view.
    }
    

}

extension EmployeesTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if company != nil {
            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
            if let employees  = filteredData {
                cell.textLabel?.text = employees[indexPath.row].name
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
   

    
}

extension EmployeesTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = company?.getEmployees().filter({$0.name.contains(searchText)})
        self.employeesTableView.reloadData()
    }
    
}
