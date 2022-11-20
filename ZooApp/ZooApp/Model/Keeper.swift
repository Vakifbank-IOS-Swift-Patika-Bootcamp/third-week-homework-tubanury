//
//  Keeper.swift
//  ZooApp
//
//  Created by Tuba N. Yıldız on 20.11.2022.
//

import Foundation


class zooKeeper {
    var name: String
    var age: Int
    var salary: Int {
        return 4000 + animals.count * 400
    }
    var animals: [animal]
    
    init (name: String, age: Int, animals: [animal]){
        self.name = name
        self.age = age
        self.animals = animals
    }
    
    func addAnimal(animal: animal) {
        self.animals.append(animal)
        print(self.animals)
        
    }
    
}
//var firstZooKeeper = zooKeeper(name: "John")
