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
    func flipCardUp(_ which: Int) {
        
        // only need to do something if card is facing down
        if matrix[which].isShowing == false {
            
            // flip up
            matrix[which].isShowing = true
            
            // update values/text
            flips += 1
            score -= 1
            message = matrix[which].text
            
            
            if (previous != -1) {
                
                // ???logic for matching???
                
                // flip over the previous card
                matrix[previous].isShowing = false
            }
            
            // remember the last card tapped
            previous = which
        }
        
    }
    
    /*
     * Return the current image for a particular Card
     */
    func getImage(_ which: Int) -> UIImage {
        return matrix[which].getImage()
    }
    
    
}
