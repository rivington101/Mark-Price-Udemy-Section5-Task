//
//  ViewController.swift
//  MyOOPGame
//
//  Created by Peter Rule on 19/02/2016.
//  Copyright © 2016 Peter Rule. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var msgCentreLbl: UILabel!
    
    @IBOutlet weak var monsterHp: UILabel!
    
    @IBOutlet weak var playerHp: UILabel!
    
    @IBOutlet weak var monsterAtkBtn: UIButton!
    
    @IBOutlet weak var soldierAtkBtn: UIButton!
    
    
    //var character: Character!
    var soldier: Player!
    var monster: Enemy!
    var game: GameState!
    var hp: Int!
    var ap: Int!
    var swordSound: AVAudioPlayer!
    var deathSound: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "startGame", userInfo: nil, repeats: false)
        setUpSoundAssetPaths()
        startGame()
    }
    

    func startGame(){
        hp = Int(arc4random_uniform(19)) + 1
        ap = Int(arc4random_uniform(3)) + 1
        monsterHp.text = "HP: \(hp)"
        playerHp.text = "HP: \(hp)"
        soldier = Player(name: "Aragon", hp: hp, attackPwr: ap)
        monster = Enemy(name: "Orc", hp: hp, attackPwr: ap)
        game = GameState(playerOne: soldier, playerTwo: monster, vc: self)
        msgCentreLbl.text = "\(monster.name) Vs \(soldier.name)"
    }
    
    @IBAction func monsterAttack(sender: AnyObject) {
        //swordSound.stop()
        game.swordNoise()
        soldier.attemptAttack(monster.attackPwr)
        game.updateHp(soldier)
    }
    
    @IBAction func soldierAttack(sender: AnyObject) {
        //swordSound.stop()
        game.swordNoise()
        monster.attemptAttack(soldier.attackPwr)
        game.updateHp(monster)
    }
    
    func setUpSoundAssetPaths() {
        let path = NSBundle.mainBundle().pathForResource("sword", ofType: "wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            try swordSound = AVAudioPlayer(contentsOfURL: soundUrl)
            swordSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        let path1 = NSBundle.mainBundle().pathForResource("death", ofType: "wav")
        let soundUrl1 = NSURL(fileURLWithPath: path1!)
        
        do {
            try deathSound = AVAudioPlayer(contentsOfURL: soundUrl1)
            deathSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }

    }

}

