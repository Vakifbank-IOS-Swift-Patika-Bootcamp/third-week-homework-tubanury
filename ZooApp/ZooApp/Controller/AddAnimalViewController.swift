//
//  AddAnimalViewController.swift
//  ZooApp
//
//  Created by Tuba N. Yıldız on 20.11.2022.
//

import UIKit

class AddAnimalViewController: UIViewController {

    var zoo: wildZoo?

    @IBOutlet weak var specieTextField: UITextField!
    
    @IBOutlet weak var dailyWaterConsumeTextField: UITextField!
    
    @IBOutlet weak var keeperTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTappedAddButton(_ sender: Any) {
        
        if let specie = self.specieTextField.text, !specie.isEmpty,
           let water = self.dailyWaterConsumeTextField.text, !water.isEmpty,
           let keeper = self.keeperTextField.text, !keeper.isEmpty
        {
            let animal = animal(specie: specie, dailyWaterConsume: Int(water)!, zoo: self.zoo!)
            zoo!.addAnimal(animal: animal)
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
