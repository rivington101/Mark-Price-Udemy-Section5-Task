//
//  Character.swift
//  MyOOPGame
//
//  Created by Peter Rule on 20/02/2016.
//  Copyright © 2016 Peter Rule. All rights reserved.
//

import Foundation

class Character {
    private var _hp: Int = 100
    private var _attackPwr: Int = 10
    private var _name = "Character"
    
    var name: String {
        get {
            return _name
        }
    }
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var isAlive: Bool {
        get {
            if hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    init(startingHp: Int, attackPwr: Int) {
        self._hp = startingHp
        self._attackPwr = attackPwr
    }
    
    func attemptAttack(attackPwr: Int) -> Bool{
        self._hp -= attackPwr
        
        return true
    }
}