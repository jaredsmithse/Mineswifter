//
//  ViewController.swift
//  Mineswifter
//
//  Created by Jared Smith on 1/2/15.
//  Copyright (c) 2015 tutorial. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let BOARD_SIZE:Int = 10
    var board:Board
    var squareButtons:[SquareButton] = []
    
    @IBOutlet weak var boardView: UIView!
    @IBOutlet weak var movesLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBAction func newGamePressed() {
        println("new game");
    }
    
    func initializeBoard() {
        for row in 0 ..< board.size {
            for col in 0 ..< board.size {
                let square = board.squares[row][col]
                let squareSize:CGFloat = self.boardView.frame.width / CGFloat(BOARD_SIZE)
                let squareButton = SquareButton(squareModel: square, squareSize: squareSize, squareMargin: 0)
                
                squareButton.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
                squareButton.addTarget(self, action: "squareButtonPressed:", forControlEvents: .TouchUpInside)
                
                self.boardView.addSubview(squareButton)
                self.squareButtons.append(squareButton)
            }
        }
    }
    
    func squareButtonPressed(sender: SquareButton) {
        println("Pressed row:\(sender.square.row), col:\(sender.square.col)")
        sender.setTitle("", forState: .Normal)
    }
    
    func startNewGame() {
        //start new game
        self.resetBoard()
    }
    
    func resetBoard() {
        // resets the board with new mine locations & sets isRevealed to false for each square
        self.board.resetBoard()
        // iterates through the buttons, resetting text to default values
        for squareButton in self.squareButtons {
            squareButton.setTitle("[x]", forState: .Normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeBoard()
        self.startNewGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init(coder aDecoder: NSCoder) {
        self.board = Board(size: BOARD_SIZE)
        super.init(coder: aDecoder)
    }

}

