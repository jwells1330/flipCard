//
//  MatchGame.swift
//  CardFlip2
//
//  Created by Joel Hollingsworth on 9/26/16.
//  Copyright © 2016 Joel Hollingsworth. All rights reserved.
//

import UIKit

class MatchGame {
    
    let deck = Deck()
    var flips = 0
    var score = 0
    var message = "Welcome!"
    
    var previous = -1
    
    var matrix: [Card] = []
    
    init() {
        for _ in 1...16 {
            matrix.append(deck.drawRandomCard())
        }
    }
    
    func flipCardUp(_ which: Int) {
        
        if matrix[which].isShowing == false {
            
            // flip up
            matrix[which].isShowing = true
            flips += 1
            score -= 1
            message = matrix[which].text
            
            if (previous != -1) {
                
                // logic for matching
                
                matrix[previous].isShowing = false
                
            }
            
            previous = which
        }
        
    }
    
    func getImage(_ which: Int) -> UIImage {
        return matrix[which].getImage()
    }
    
    
}







