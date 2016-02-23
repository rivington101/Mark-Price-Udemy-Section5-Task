//
//  GameState.swift
//  MyOOPGame
//
//  Created by Peter Rule on 20/02/2016.
//  Copyright © 2016 Peter Rule. All rights reserved.
//

import Foundation

class GameState {
    private var _playerOne: Player!
    private var _playerTwo: Enemy!
    private var _vc: ViewController
    
    init(playerOne: Player, playerTwo: Enemy, vc: ViewController) {
        self._playerOne = playerOne
        self._playerTwo = playerTwo
        self._vc = vc
    }
    
    func restartGame() {
        
    }
    
    func updateMessageBoard() {
        
    }
    
    func updateHp() {
        self._vc.playerHp.text = "HP: \(_playerOne.hp)"
        self._vc.monsterHp.text = "HP: \(_playerTwo.hp)"
    }
    
    func isGameOver() {
        
    }
    
}