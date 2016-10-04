//
//  MatchGame.swift
//  CardFlip2
//
//  Created by Joel Hollingsworth on 9/26/16.
//  Copyright © 2016 Joel Hollingsworth. All rights reserved.
//

import UIKit

/**
 * This is the Model for the Match Game.
 */
class MatchGame {
    
    let deck = Deck()
    var flips = 0
    var score = 0
    var message = "Welcome!"
    
    var previous = -1
    
    var matrix: [Card] = []
    
    init() {
        print("test")
        flips = 0
        score = 0
        // draw 16 random cards
        for _ in 1...16 {
            matrix.append(deck.drawRandomCard())
        }
    }
    
    /*
     * Called when a card is tapped.
     */
    func flipCardUp(_ which: Int) -> Bool{
        
        // only need to do something if card is facing down
        if matrix[which].isShowing == false {
            
            // flip up
            matrix[which].isShowing = true
            
            // update values/text
            flips += 1
            message = matrix[which].text
            
            
            if (previous != -1) {
                if(matrix[previous].suit == matrix[which].suit) {
                    message = "Suit Match"
                    score += 5
                    matrix[previous].isShowing = true
                    
                    previous = -1
                    return true
                }
                else if (matrix[previous].value == matrix[which].value){
                    message = "Value Match"
                    score += 16
                    matrix[previous].isShowing = true;
                    
                    
                    previous = -1
                    return true
                }
                else{
                    // flip over the previous card
                    
                    score -= 1
                    matrix[previous].isShowing = false
                    matrix[which].isShowing = false
                    
                    
                    previous = -1
                    return false
                }
            }
            
            // remember the last card tapped
            previous = which
            
        }
        return false
    }
    
    /*
     * Return the current image for a particular Card
     */
    func getImage(_ which: Int) -> UIImage {
        return matrix[which].getImage()
    }
    
    func turnDown(){
        for int in 0...16{
            print(int)
            matrix[int].isShowing = false
        }
    }
    
    
}
