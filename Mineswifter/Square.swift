//
//  Square.swift
//  Mineswifter
//
//  Created by Jared Smith on 1/2/15.
//  Copyright (c) 2015 tutorial. All rights reserved.
//

import Foundation

class Square {
    let row:Int
    let col:Int
    
    
    //values that are re-assigned at the start of every new game
    var numNeighboringMines = 0
    var isMineLocation = false
    var isRevealed = false
    
    init(row:Int, col:Int) {
        self.row = row
        self.col = col
    }
}