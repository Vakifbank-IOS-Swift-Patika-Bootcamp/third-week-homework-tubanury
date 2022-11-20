//
//  AddEmployeeViewController.swift
//  CompanyApp
//
//  Created by Tuba N. Yıldız on 19.11.2022.
//

import UIKit

enum status {
    case success
    case error
}

class AddEmployeeViewController: UIViewController {

    var company: SoftwareCompany?
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var departmentTextField: UITextField!
    
    @IBOutlet weak var marialStatusTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var salaryTextField: UITextField!
    
    let titles = ["Junior", "Mid Level", "Senior"]
    let teams = ["Ios", "Android", "Web", "Data"]
    let marialStatus = ["Single", "Married", "Widowed"]

    var titlePickerView = UIPickerView()
    var deparmentsPickerView = UIPickerView()
    var marialStatusPickerView = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
                
        titleTextField.inputView = titlePickerView
        departmentTextField.inputView = deparmentsPickerView
        marialStatusTextField.inputView = marialStatusPickerView
        
        salaryTextField.isEnabled = false
        salaryTextField.text = "₺0.00"

        titlePickerView.delegate = self
        titlePickerView.dataSource = self
        titleTextField.text = titles[0]
        
        deparmentsPickerView.delegate = self
        deparmentsPickerView.dataSource = self
        departmentTextField.text = teams[0]

        
        marialStatusPickerView.delegate = self
        marialStatusPickerView.dataSource = self
        marialStatusTextField.text = marialStatus[0]

        titlePickerView.tag = 1
        deparmentsPickerView.tag = 2
        marialStatusPickerView.tag = 3


    }
   
    @IBAction func didAgeEdited(_ sender: Any) {

        if let age = ageTextField.text, !age.isEmpty{
            let salary = Int(age)! * 1000 * (CompanyApp.title(rawValue: titleTextField.text!)?.salaryFactor())!
            salaryTextField.text = "₺" + String(salary)
        }
        
    }
    
    @IBAction func didTitleEdited(_ sender: Any) {
        if let age = ageTextField.text, !age.isEmpty{
            let salary = Int(age)! * 1000 * (CompanyApp.title(rawValue: titleTextField.text!)?.salaryFactor())!
            salaryTextField.text = "₺" + String(salary)

        }
    }
    @IBAction func didTapAddEmployee(_ sender: Any) {
        if let title = self.titleTextField.text, !title.isEmpty,
           let age = self.ageTextField.text, !age.isEmpty,
           let name = self.nameTextField.text, !name.isEmpty,
           let department = self.departmentTextField.text, !department.isEmpty,
           let marialStatus = self.marialStatusTextField.text, !marialStatus.isEmpty
        {
            let employee = Employee(name: name,
                                    age: Int(age)!,
                                    marialStatus: CompanyApp.marialStatus(rawValue: marialStatus)!,
                                    title: CompanyApp.title(rawValue: title)!,
                                    team: CompanyApp.team(rawValue: department)!)
            company!.addEmployee(emp: employee)
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

extension AddEmployeeViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return titles.count
        case 2:
            return teams.count
        case 3:
            return marialStatus.count
        default:
            return 1
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return titles[row]
        case 2:
            return teams[row]
        case 3:
            return marialStatus[row]
        default:
            return "Data not found."
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView.tag {
        case 1:
            titleTextField.text = titles[row]
            titleTextField.resignFirstResponder()
        case 2:
            departmentTextField.text = teams[row]
            departmentTextField.resignFirstResponder()
        case 3:
            marialStatusTextField.text = marialStatus[row]
            marialStatusTextField.resignFirstResponder()
        default:
            return
        }
    }
    
}
