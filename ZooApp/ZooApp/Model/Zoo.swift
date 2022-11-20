//
//  Zoo.swift
//  ZooApp
//
//  Created by Tuba N. Yıldız on 20.11.2022.
//

import Foundation


protocol zoo {
    var dailyWaterLimit: Int { get set }
    var budget: Int { get set }
    var animals: [animal] { get }
    var zooKeepers: [zooKeeper] {get}
        
    func increaseWaterLimit(amount: Int)
    func increaseBudget(amount: Int)
    func spendForSth(amount: Int)
    func addZooKeeper(keeper: zooKeeper)
    func addAnimal(animal: animal)
    func paySalaries()
    
}


class wildZoo {
    
    var dailyWaterLimit: Int
    var remainingWaterLimit: Int
    var budget: Int
    var animals: [animal]?
    var zooKeepers: [zooKeeper]
        
    
    init(dailyWaterLimit: Int, budget: Int, zooKeepers: [zooKeeper]) {
        self.dailyWaterLimit = dailyWaterLimit
        self.budget = budget
        self.remainingWaterLimit = dailyWaterLimit
        self.zooKeepers = zooKeepers
    }
    
    func increaseWaterLimit(amount: Int) {
        dailyWaterLimit += amount
        remainingWaterLimit += amount
    }
    func increaseBudget(amount: Int) {
        budget += amount
    }
    func spendForSth(amount: Int) {
        if budget - amount > 0 {
            budget -= amount
        }
        else {
            print ("Insufficient balance!")
        }
        
    }
    func paySalaries(){
        
        for keeper in zooKeepers {
            budget -= keeper.salary
        }
    }
    
    func addZooKeeper(keeper: zooKeeper){
        zooKeepers.append(keeper)
    }
        
    func addAnimal(animal: animal){
        if animal.dailyWaterConsume < remainingWaterLimit {
            animals?.append(animal)
            remainingWaterLimit -= animal.dailyWaterConsume
            self.zooKeepers.randomElement()?.addAnimal(animal: animal)
        }
        else {
            print("Exceeded water limit. Try increasing water Limit first!")
        }
    }

}





//var capeTownZoo = wildZoo(dailyWaterLimit: 10000, budget: 100_000_000)

//capeTownZoo.addZooKeeper(keeper: firstZooKeeper)



//capeTownZoo.addAnimal(animal: monkey)
//capeTownZoo.addAnimal(animal: dog)







