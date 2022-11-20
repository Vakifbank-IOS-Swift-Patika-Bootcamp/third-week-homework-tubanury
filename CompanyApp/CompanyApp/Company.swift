//
//  Company.swift
//  CompanyApp
//
//  Created by Tuba N. Yıldız on 19.11.2022.
//

import Foundation

import Foundation


enum marialStatus: String {
    case single = "Single"
    case married = "Married"
    case widow = "Widowed"
}

enum team: String {
    case ios = "Ios"
    case android = "Android"
    case web = "Web"
    case data = "Data"
}

protocol Company {
    var name: String { get set }
    var budget: Int { get set }
    var foundationYear: Int { get set }
    var employeeCount: Int {get}
        
    func paySalaries() -> Bool
    func addEmployee(emp: Employee)
    

}

class SoftwareCompany: Company{
    
    var name: String
    var budget: Int
    var foundationYear: Int
    var employeeCount: Int {
        return employees.count
    }
    var employees: [Employee]

    init(name: String, budget: Int, foundationYear: Int, employeeCount: Int = 0, employees: [Employee]) {
           self.name = name
           self.budget = budget
           self.foundationYear = foundationYear
           self.employees = employees
    }
    func paySalaries() -> Bool{
        var result = true
        employees.forEach {
            if budget > $0.salary {
                budget -= $0.salary
            }
            else {
                result = false
            }
        }
        return result
    }
    
    func addEmployee(emp: Employee) {
        emp.company = self
        
        employees.append(emp)
    }
    
    func getEmployees() -> [Employee] {
        return employees
    }
}




//var comp = SoftwareCompany(name: "Vakif Bank", budget: 100_000_000_000, foundationYear: 1954)

//var emp =  Employee(name: "Tuba Sahin", age: 25, marialStatus: .married, title: .junior)



