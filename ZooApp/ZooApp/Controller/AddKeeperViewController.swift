//
//  AddKeeperViewController.swift
//  ZooApp
//
//  Created by Tuba N. Yıldız on 20.11.2022.
//

import UIKit

class AddKeeperViewController: UIViewController {

    var zoo: wildZoo?
    
    @IBOutlet weak var fullNameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var salaryTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func didTappedAddButton(_ sender: Any) {
        if let name = self.fullNameTextField.text, !name.isEmpty,
           let age = self.ageTextField.text, !age.isEmpty
        {
            let keeper = zooKeeper(name: name,
                                    age: Int(age)!,
                                    animals: [])
            zoo!.addZooKeeper(keeper: keeper)
            self.presentAlert("Added Successfully", "Ok!" , .success)
        }
        else {
            self.presentAlert("Please enter all information completely.", "Try again", .error)
            return
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
