//
//  ViewController.swift
//  MyOOPGame
//
//  Created by Peter Rule on 19/02/2016.
//  Copyright © 2016 Peter Rule. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var soldier: Player!
    var monster: Enemy!
    var game: GameState!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startGame()
    }
    

    func startGame(){
        soldier = Player(name: "Aragon", hp: 100, attackPwr: 20)
        monster = Enemy(name: "Orc", hp: 100, attackPwr: 20)
        var game = GameState()
    }
    
    @IBAction func monsterAttack(sender: AnyObject) {
    }
    
    @IBAction func soldierAttack(sender: AnyObject) {
    }


}

