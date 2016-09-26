//
//  ViewController.swift
//  CardFlip2
//
//  Created by Joel Hollingsworth on 9/14/16.
//  Copyright © 2016 Joel Hollingsworth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var flipsLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var messageAreaLabel: UILabel!
    @IBOutlet weak var card1_1: UIImageView!
    @IBOutlet weak var card1_2: UIImageView!
    @IBOutlet weak var card1_3: UIImageView!
    @IBOutlet weak var card1_4: UIImageView!
    @IBOutlet weak var card2_1: UIImageView!
    @IBOutlet weak var card2_2: UIImageView!
    @IBOutlet weak var card2_3: UIImageView!
    @IBOutlet weak var card2_4: UIImageView!
    @IBOutlet weak var card3_1: UIImageView!
    @IBOutlet weak var card3_2: UIImageView!
    @IBOutlet weak var card3_3: UIImageView!
    @IBOutlet weak var card3_4: UIImageView!
    @IBOutlet weak var card4_1: UIImageView!
    @IBOutlet weak var card4_2: UIImageView!
    @IBOutlet weak var card4_3: UIImageView!
    @IBOutlet weak var card4_4: UIImageView!

    // create the Model
    var matchGame = MatchGame()
    
    var imageViews: [UIImageView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageViews = [card1_1, card1_2, card1_3, card1_4,
                      card2_1, card2_2, card2_3, card2_4,
                      card3_1, card3_2, card3_3, card3_4,
                      card4_1, card4_2, card4_3, card4_4]
        
        messageAreaLabel.text = matchGame.message
    }
    
    
    @IBAction func cardTap(_ sender: UITapGestureRecognizer) {
        
        let card = sender.view! as! UIImageView
    
        var which = -1
        
        // which card was tapped?
        for i in 0..<imageViews.count {
            if imageViews[i] == card {
                which = i
            }
        }
    
        if (which > -1) {
            matchGame.flipCardUp(which)
            
            for i in 0..<imageViews.count {
                imageViews[i].image = matchGame.getImage(i)
            }
            
            flipsLabel.text = "Flips: \(matchGame.flips)"
            scoreLabel.text = "Score: \(matchGame.score)"
            messageAreaLabel.text = matchGame.message
            
        }
    }
}








