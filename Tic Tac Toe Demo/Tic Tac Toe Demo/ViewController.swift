//
//  ViewController.swift
//  Tic Tac Toe Demo
//
//  Created by Royce on 07/12/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var labelWinner: UILabel!
    @IBOutlet weak var buttonPlayAgain: UIButton!
    
    
    
    enum State: Int {
        case empty = 0
        case nought = 1
        case cross = 2
    }
    
    var isGameActive = true
    var activePlayer = State.nought
    var gameState: [State] = []
    
    let winningCombinations = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<9 {
            gameState.append(State.empty)
        }
        
    }
    
    func toggleBoardAreaAndPlayer(_ sender: UIButton, position activePosition: Int) {
        gameState[activePosition] = activePlayer
        if activePlayer == State.nought {
            sender.setImage(UIImage(named: "nought.png"), for: [])
            activePlayer = State.cross
        } else {
            sender.setImage(UIImage(named: "cross.png"), for: [])
            activePlayer = State.nought
        }
    }
    
    func checkForWinner() {
        for combination in winningCombinations {
            if gameState[combination[0]] != State.empty
                && gameState[combination[0]] == gameState[combination[1]]
                && gameState[combination[1]] == gameState[combination[2]] {
                
                // We have a winner!
                isGameActive = false
                
                labelWinner.isHidden = false
                buttonPlayAgain.isHidden = false
                
                if gameState[combination[0]] == State.nought {
                    labelWinner.text = "Noughts has won!"
                } else {
                    labelWinner.text = "Crosses has won!"
                }
                
                UIView.animate(withDuration: 1, animations: {
                    self.labelWinner.center = CGPoint(x: self.labelWinner.center.x + 500, y: self.labelWinner.center.y)
                    self.buttonPlayAgain.center = CGPoint(x: self.buttonPlayAgain.center.x + 500, y: self.buttonPlayAgain.center.y)
                    
                })
                
            }
            
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let activePosition = sender.tag - 1
        
        if isGameActive && gameState[activePosition] == State.empty  {
            toggleBoardAreaAndPlayer(sender, position: activePosition)
            checkForWinner()
        }
    }
    
    @IBAction func playAgainTapped(_ sender: UIButton) {
        isGameActive = true
        activePlayer = State.nought
        resetBoard()
    }
    
    func resetBoard() {
        for i in 0..<9 {
            gameState[i] = State.empty
        }
        
        for i in 1..<10 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [])
            }
            
            labelWinner.isHidden = true
            buttonPlayAgain.isHidden = true
            
            labelWinner.center = CGPoint(x: labelWinner.center.x - 500, y: labelWinner.center.y)
            buttonPlayAgain.center = CGPoint(x: buttonPlayAgain.center.x - 500, y: buttonPlayAgain.center.y)
        }
    }
    
}

