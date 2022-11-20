//
//  Animal.swift
//  ZooApp
//
//  Created by Tuba N. Yıldız on 20.11.2022.
//

import Foundation
class animal {
    var specie: String
    var dailyWaterConsume: Int
    var voice: String {
        return specie
    }
    //var keeper: zooKeeper
    var zoo: wildZoo
    
    init (specie: String, dailyWaterConsume: Int, zoo: wildZoo){
        self.specie = specie
        self.dailyWaterConsume = dailyWaterConsume
        self.zoo = zoo
        //self.keeper = keeper
    }
}

//var monkey = animal(specie: "Rhinopithecus roxellana", dailyWaterConsume: 100, voice: "monkey voice", zoo: capeTownZoo)

//var dog = animal(specie: "Buldog", dailyWaterConsume: 50, voice: "Bark!", zoo: capeTownZoo)
