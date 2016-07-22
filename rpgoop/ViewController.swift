//
//  ViewController.swift
//  rpgoop
//
//  Created by Dino Musliu on 11/07/2016.
//  Copyright © 2016 Dino Musliu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var printLbl : UILabel!
    
    @IBOutlet weak var playerHpLbl: UILabel!

    @IBOutlet weak var enemyImg: UIImageView!
    
    @IBOutlet weak var chestBtn: UIButton!
    
    @IBOutlet weak var EnemyHpLbl: UILabel!
    

    
    var player: Player!
    var enemy: Enemy!
    var chestMessage : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "DirtyLaundry21", hp: 110, attackPwr: 20)
        
        genereteRandomEnemy()
        
        playerHpLbl.text = "\(player.hp) HP"
        
    }
    
    @IBAction func onChestTapped(sender: AnyObject) {
        chestBtn.hidden = true
        printLbl.text = chestMessage
        
        
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "genereteRandomEnemy", userInfo: nil, repeats: false)
        
        //genereteRandomEnemy()
    }
    
    func genereteRandomEnemy(){
    
    
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPwr: 12)
        } else {
            
            enemy = DevilWizard(startingHp: 60, attackPwr: 15)
        }
        
        enemyImg.hidden = false
    }
    
    @IBAction func attackTapped(sender: AnyObject) {
        
        if enemy.attemptAttack(player.attackPwr) {
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            EnemyHpLbl.text = "\(enemy.hp) HP"
        } else {
            printLbl.text = "Attack was unsuccessful!"
        }
        
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
            chestBtn.hidden = false
        }
        
        if !enemy.isAlive {
            EnemyHpLbl.text = ""
            printLbl.text = "Killed \(enemy.type)"
            enemyImg.hidden = true
        }

    }


}

