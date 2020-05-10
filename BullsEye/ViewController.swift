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
        let points = 100 - difference
        
        score += points
        
        let message = "The value of the slider is: \(currentValue)" + "\nThe targe value is: \(targetValue)" + "\nThe difference is: \(difference)"
        
        let alert = UIAlertController(title: "Hello, World",
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default,
                                   handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    /*
     When the ViewController loads:
     startNewRound is called.
 */
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
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

