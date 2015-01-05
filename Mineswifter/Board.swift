//
//  Board.swift
//  Mineswifter
//
//  Created by Jared Smith on 1/2/15.
//  Copyright (c) 2015 tutorial. All rights reserved.
//

import Foundation

class Board {
    let size:Int
    var squares:[[Square]] = [] //matrix of squares
    
    init(size:Int) {
        self.size = size
        
        for row in 0 ..< size {
            var squareRow:[Square] = []
            for col in 0 ..< size {
                let square = Square(row: row, col: col)
                squareRow.append(square)
            }
            squares.append(squareRow)
        }
    }
    
    func resetBoard() {
        //assign the minds to the squares
        for row in 0 ..< size {
            for col in 0 ..< size {
                squares[row][col].isRevealed = false
                self.calculateIsMineLocationForSquare(squares[row][col])
            }
        }
        
        //calculate the number of neighboring squares
        for row in 0 ..< size {
            for col in 0 ..< size {
                self.calculateNumNeighborMinesForSquare(squares[row][col])
            }
        }
    }
    
    func calculateIsMineLocationForSquare(square:Square) {
        square.isMineLocation = ((arc4random()%10) == 0)
    }
    
    func calculateNumNeighborMinesForSquare(square:Square) {
        //firs we need a list of all adjacent squares
        let neighbors = getNeighboringSquares(square)
        var numNeighboringMines = 0
        
        //for each neighbor with a mine, add 1 to this square's count
        for neighborSquare in neighbors {
            if neighborSquare.isMineLocation {
                numNeighboringMines++
            }
        }
        square.numNeighboringMines = numNeighboringMines
    }
    
    func getNeighboringSquares(square:Square) -> [Square] {
        var neighbors:[Square] = []
        
        //an array of tuples hardcoded for getting the position of the neighbors 
        //relative to a given square
        let adjacentOffsets =
        [(-1,-1), (0,-1), (1,-1),
        (-1,0), (1,0),
        (-1,1), (0,1), (1,1)]
        
        for (rowOffset, colOffset) in adjacentOffsets {
            //getTileAtLocation might return a Square, or it could return nil, so we want 
            // to use the optional datatype
            let optionalNeighbor:Square? = getTileAtLocation(square.row + rowOffset, col: square.col + colOffset)
            
            //only evaluates true if the optional tile isn't nil
            if let neighbor = optionalNeighbor {
                neighbors.append(neighbor)
            }
            
        }
        return neighbors
    }
    
    func getTileAtLocation(row:Int, col:Int) -> Square? {
        if row >= 0 && row < self.size && col >= 0 && col < self.size {
            return squares[row][col]
        } else {
            return nil
        }
    }
    
}