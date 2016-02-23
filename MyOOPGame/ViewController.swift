//
//  ViewController.swift
//  MyOOPGame
//
//  Created by Peter Rule on 19/02/2016.
//  Copyright © 2016 Peter Rule. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var msgCentreLbl: UILabel!
    
    @IBOutlet weak var monsterHp: UILabel!
    
    @IBOutlet weak var playerHp: UILabel!
    
    //var character: Character!
    var soldier: Player!
    var monster: Enemy!
    var game: GameState!
    var hp: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startGame()
    }
    

    func startGame(){
        //character = Character(startingHp: 100, attackPwr: 20)
        soldier = Player(name: "Aragon", hp: 99, attackPwr: 20)
        monster = Enemy(name: "Orc", hp: 99, attackPwr: 20)
        game = GameState(playerOne: soldier, playerTwo: monster, vc: self)
    }
    
    @IBAction func monsterAttack(sender: AnyObject) {
        soldier.attemptAttack(monster.attackPwr)
        game.updateHp()
    }
    
    @IBAction func soldierAttack(sender: AnyObject) {
    }



}

