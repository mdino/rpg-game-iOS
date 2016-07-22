//
//  DevilWizard.swift
//  rpgoop
//
//  Created by Dino Musliu on 12/07/2016.
//  Copyright © 2016 Dino Musliu. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    
    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
}