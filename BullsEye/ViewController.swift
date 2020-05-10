//
//  ViewController.swift
//  BullsEye
//
//  Created by Buck Rozelle on 5/9/20.
//  Copyright © 2020 buckrozelledotcomLLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var targetValue = 0
    var currentValue = 50
    var score = 0
    var round = 0
    
    //round outlet
    @IBOutlet weak var roundLabel: UILabel!
    
    //slider.value goes into slider as instance var.
    @IBOutlet weak var slider: UISlider!
    
    //targetValue outlet
    @IBOutlet weak var targetLabel: UILabel!
    
    //score outlet
    @IBOutlet weak var scoreLabel: UILabel!
    
    //user press the start over button
    @IBAction func startNewGame(){
        score = 0
        round = 0
        startNewRound()
    }
    
    //slider outlet
    @IBAction func sliderMoved(_ slider: UISlider) {
        
        //round slider.value and it into currentValue
        currentValue = lroundf(slider.value)
        print("The value of the slider is now: \(slider.value)")
    }
    
    /*
     User presses Hit Me! button.
 */
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        // Calculate points
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
          score += points
        
        let message = "You scored \(points)"
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default,
                                   handler: {
                                     _ in self.startNewRound()
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    /*
     When the ViewController loads:
     startNewGame is called.
 */
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }
    
    /*
     User presses the startOver button and:
     slider.value is rounded off and stored in currentValue(typed as a Float.)
     targetValue is assigned a new random number between 1 and 100.
 */
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    /*
     Updates...
 */
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }


}

