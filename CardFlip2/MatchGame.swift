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
            score -= 1
            message = matrix[which].text
            
            
            if (previous != -1) {
                if(matrix[previous].suit == matrix[which].suit) {
                    print("test suit")

                    score += 5
                    matrix[previous].isShowing = true

                    
                    let image = matrix[previous].makeOpaque()
                    matrix[previous].frontImage = image
                    
                    previous = -1
                    return true
                }
                else if (matrix[previous].value == matrix[which].value){
                    print("test value")

                    matrix[previous].isShowing = true;
                    score += 17
                    previous = -1
                    return true
                }
                else{
                    // flip over the previous card
                    print("test no match")
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
    
    
}
