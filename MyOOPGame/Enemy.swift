//
//  Enemy.swift
//  MyOOPGame
//
//  Created by Peter Rule on 20/02/2016.
//  Copyright © 2016 Peter Rule. All rights reserved.
//

import Foundation

class Enemy: Character {
    private var _name = "Enemy"
    
    override var name: String {
        get {
            return _name
        }
    }
    
    convenience init(name: String, hp: Int, attackPwr: Int) {
        self.init(startingHp: hp, attackPwr: attackPwr)
        
        _name = name
        
    }

}