//
//  Employee.swift
//  CompanyApp
//
//  Created by Tuba N. Yıldız on 19.11.2022.
//

import Foundation


enum title: String {
    case junior = "Junior"
    case mid = "Mid Level"
    case senior = "Senior"
    
    func salaryFactor() -> Int {
        switch self{
        case .junior:
            return 2
        case .mid:
            return 3
        case .senior:
            return 4
        }
    }
}

class Employee {
    var name: String
    var age: Int
    var marialStatus: marialStatus
    var title: title
    var company: Company?
    var team: team
    
    var salary: Int {
        return  age*1000*title.salaryFactor()
    }
    
    
    init(name: String, age: Int, marialStatus: marialStatus, title: title, team: team) {
           self.name = name
           self.age = age
           self.marialStatus = marialStatus
           self.title = title
           self.team = team
    }
    
    func promote(title: title){
        self.title = title
    }
    
    
}
