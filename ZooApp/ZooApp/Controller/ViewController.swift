//
//  ViewController.swift
//  ZooApp
//
//  Created by Tuba N. Yıldız on 20.11.2022.
//

import UIKit

class ViewController: UIViewController {
   
    
    var zoo = wildZoo(dailyWaterLimit: 10000, budget: 100_000_000, zooKeepers: [])

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTappedIncreaseBudget(_ sender: Any) {
        let alertController = UIAlertController(title: "Enter budget", message: "", preferredStyle: UIAlertController.Style.alert)
       
        let saveAction = UIAlertAction(title: "Add", style: UIAlertAction.Style.default, handler: { alert -> Void in
                let firstTextField = alertController.textFields![0] as UITextField
                let budget = firstTextField.text!
                self.zoo.increaseBudget(amount: Int(budget)!)
                self.presentAlert("Successfully Increased!", "Ok", .success)
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
                (action : UIAlertAction!) -> Void in })
        alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "Budget"
            }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func didTappedAddExpense(_ sender: Any) {
        let alertController = UIAlertController(title: "Enter expense", message: "", preferredStyle: UIAlertController.Style.alert)
       
        let saveAction = UIAlertAction(title: "Do", style: UIAlertAction.Style.default, handler: { alert -> Void in
                let firstTextField = alertController.textFields![0] as UITextField
                let budget = firstTextField.text!
                self.zoo.spendForSth(amount: Int(budget)!)
                self.presentAlert("Successfull!", "Ok", .success)
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
                (action : UIAlertAction!) -> Void in })
        alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "Expense"
            }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func didTappedWaterLimit(_ sender: Any) {
        let alertController = UIAlertController(title: "Enter water limit", message: "", preferredStyle: UIAlertController.Style.alert)
       
        let saveAction = UIAlertAction(title: "Do", style: UIAlertAction.Style.default, handler: { alert -> Void in
                let firstTextField = alertController.textFields![0] as UITextField
                let budget = firstTextField.text!
                self.zoo.increaseWaterLimit(amount: Int(budget)!)
                self.presentAlert("Successfully Increased Water Limit!", "Ok", .success)
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
                (action : UIAlertAction!) -> Void in })
        alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "Water Limit"
            }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addKeeper"{
            let addKeeper = segue.destination as! AddKeeperViewController
            addKeeper.zoo = self.zoo
        } else if segue.identifier == "addAnimal"{
            let addAnimal = segue.destination as! AddAnimalViewController
            addAnimal.zoo = self.zoo
        }
        else if segue.identifier == "showList"{
            let showList = segue.destination as! KeeperAnimalListViewController
            showList.zoo = self.zoo
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

