//
//  ViewController.swift
//  CompanyApp
//
//  Created by Tuba N. Yıldız on 19.11.2022.
//

import UIKit

class ViewController: UIViewController {

    var company = SoftwareCompany(name: "Vakif Bank", budget: 100_000_000_000, foundationYear: 1954, employees: [])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTappedPaySalaries(_ sender: Any) {
        if company.paySalaries() {
            self.presentAlert("Payed Successfully", "Ok!" , .success)
        }
        else {
            self.presentAlert("Insufficent Budget!", "Ok!" , .success)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addEmployee"{
            let addEmployee = segue.destination as! AddEmployeeViewController
            addEmployee.company = self.company
        } else if segue.identifier == "showEmployees"{
            let listEmployee = segue.destination as! EmployeesTableViewController
            listEmployee.company = self.company
        }
    }
    func presentAlert(_ message: String, _ actionTitle: String, _ status: status){
        let alert = UIAlertController(title: "", message: message , preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: actionTitle , style: UIAlertAction.Style.default, handler: { _ in
            if status == .success {
                _ = self.navigationController?.popToRootViewController(animated: true)
            }
        }))
        self.present(alert, animated: true, completion: nil)

    }

}

