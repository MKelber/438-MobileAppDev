//
//  Pet.swift
//  MasonKelber-Lab2
//
//  Created by Mason Kelber on 10/12/20.
//  Copyright © 2020 Mason Kelber. All rights reserved.
//

import Foundation
import UIKit
class Pet{
    let name: String
    var happiness: CGFloat
    var hunger: CGFloat
    var playCount: Int
    var fedCount: Int
    
    init(name: String) {
        self.name = name
        //initially starts with 0 happiness and hunger
        happiness = 0
        hunger = 0
        playCount = 0
        fedCount = 0
    }
    func play(){
        //the bar starts at 1 not 0
        if (hunger <= 1){
            hunger = 1
        }
        if (happiness <= 0){
            happiness = 0
        }
        //CREATIVE PORTION
        //if the pet is not at least partially full, they don't gain happiness from playing, and playing decreases fullness
        if hunger <= CGFloat(4){
            if(playCount>0){
                playCount -= 1
            }
            if(playCount < 10){
                happiness -= 1
            }
            if(fedCount < 10){
                hunger -= 1
            }
            if(fedCount>0){
                fedCount -= 1
            }
        }

        else if happiness != CGFloat(10) && hunger > 0{
            playCount += 1
            happiness += 1
            if(fedCount < 10){
                hunger -= 1
            }
            fedCount -= 1
        }
        else{
            playCount += 1
            if(fedCount > 0){
                fedCount -= 1
            }
            if(fedCount < 10){
                hunger -= 1
            }
        }
    }
    
    func feed(){
        if hunger != CGFloat(10){
        hunger += 1
        fedCount += 1
        }
        else{
            fedCount += 1
        }
    }
    
}
