//
//  SquareButton.swift
//  Mineswifter
//
//  Created by Jared Smith on 1/3/15.
//  Copyright (c) 2015 tutorial. All rights reserved.
//

import UIKit

class SquareButton : UIButton {
    let squareSize:CGFloat
    let squareMargin:CGFloat
    var square:Square
    
    init(squareModel:Square, squareSize:CGFloat, squareMargin:CGFloat) {
        self.square = squareModel
        self.squareSize = squareSize
        self.squareMargin = squareMargin
        let x = CGFloat(self.square.col) * (squareSize + squareMargin)
        let y = CGFloat(self.square.row) * (squareSize + squareMargin)
        let squareFrame = CGRectMake(x, y, squareSize, squareSize)
        super.init(frame: squareFrame)
    }
    
    func getLabelText() -> String {
        // check the isMineLocation and numNeighboringMines properties to determine the 
        // string to be returned
        if !self.square.isMineLocation {
            if isEmpty() {
                //no mine and no neighboring mines
                return ""
            } else {
                //no mine, but there are neighboring ones
                return "\(self.square.numNeighboringMines)"
            }
        }
        //its a mine
        return "M"
    }
    
    func isEmpty() -> Bool {
        return self.square.numNeighboringMines == 0
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
