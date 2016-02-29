//
//  GameState.swift
//  MyOOPGame
//
//  Created by Peter Rule on 20/02/2016.
//  Copyright © 2016 Peter Rule. All rights reserved.
//

import Foundation

class GameState: NSObject {
    private var _playerOne: Player!
    private var _playerTwo: Enemy!
    private var _vc: ViewController
    
    init(playerOne: Player, playerTwo: Enemy, vc: ViewController) {
        self._playerOne = playerOne
        self._playerTwo = playerTwo
        self._vc = vc
    }
    
    func restartGame() {
        self._vc.startGame()
    }
    
    func updateMessageBoard(message: String) {
        self._vc.msgCentreLbl.text = message
    }
    
    func updateHp(character: Character) {
        if !character.isAlive {
            self.updateMessageBoard("\(character.name) Loses")
            self.deathSound()
            NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "restartGame", userInfo: nil, repeats: false)
            
        } else {
            //self.swordNoise()
            self._vc.playerHp.text = "HP: \(_playerOne.hp)"
            self._vc.monsterHp.text = "HP: \(_playerTwo.hp)"
            disableAtkBtns()
        }
        
    }
    
    func deathSound() {
        if self._vc.deathSound.playing {
           self._vc.deathSound.stop()
        }
        self._vc.deathSound.play()
    }
    
    func swordNoise() {
        if self._vc.swordSound.playing {
            self._vc.swordSound.stop()
        }
        self._vc.swordSound.play()
    }
    
    func disableAtkBtns() {
        let delay: NSTimeInterval = Double(arc4random_uniform(2))
        self._vc.monsterAtkBtn.enabled = false
        self._vc.soldierAtkBtn.enabled = false
        NSTimer.scheduledTimerWithTimeInterval(delay, target: self, selector: "enableAtkBtns", userInfo: nil, repeats: false)
    }
    
    func enableAtkBtns() {
        self._vc.monsterAtkBtn.enabled = true
        self._vc.soldierAtkBtn.enabled = true
    }
    
}