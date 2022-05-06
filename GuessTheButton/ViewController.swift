//
//  ViewController.swift
//  GuessTheButton
//
//  Created by Alex Ionescu on 04.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var changingTitle: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var StartButton: UIButton!
    
    @IBOutlet weak var numberOfTriesLabel: UILabel!
    @IBOutlet weak var winCountLabel: UILabel!
    @IBOutlet weak var loseCountLabel: UILabel!
    
    @IBOutlet weak var numberOfTries: UILabel!
    @IBOutlet weak var winCount: UILabel!
    @IBOutlet weak var loseCount: UILabel!
    @IBOutlet weak var resetCount: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstButton.isEnabled = false
        secondButton.isEnabled = false
        thirdButton.isEnabled = false
        firstButton.layer.cornerRadius = 10
        secondButton.layer.cornerRadius = 10
        thirdButton.layer.cornerRadius = 10
        StartButton.layer.cornerRadius = 10
    }
    var winningNumber = Int.random(in:0...2)
    var tries = 0
    var wins = 0
    var loses = 0
    
    func winningCheck(number : Int) {
        if number == winningNumber {
            changingTitle.text = "You win !\n\n🎉🎊🎉"
            firstButton.isEnabled = false
            secondButton.isEnabled = false
            thirdButton.isEnabled = false
            tries+=1
            wins+=1
            numberOfTries.text = String(tries)
            winCount.text = String(wins)
        } else {
            changingTitle.text = "You lose !\n\nPlease try again😁"
            firstButton.isEnabled = false
            secondButton.isEnabled = false
            thirdButton.isEnabled = false
            tries+=1
            loses+=1
            numberOfTries.text = String(tries)
            loseCount.text = String(loses)
        }
    }
    
    @IBAction func firstButtonTap(_ sender: UIButton) {
        let firstButtonNumber = Int.random(in: 0...2)
        self.view.backgroundColor = UIColor.systemCyan
        winningCheck(number: firstButtonNumber)
        resetCount.isEnabled = true
    }
    
    @IBAction func secondButtonTap(_ sender: UIButton) {
        let secondButtonNumber = Int.random(in: 0...2)
        self.view.backgroundColor = UIColor.systemMint
        winningCheck(number: secondButtonNumber)
        resetCount.isEnabled = true
    }
    
    
    @IBAction func thirdButtonPress(_ sender: UIButton) {
        let thirdButtonNumber = Int.random(in: 0...2)
        self.view.backgroundColor = UIColor.systemTeal
        winningCheck(number: thirdButtonNumber)
        resetCount.isEnabled = true
    }
    
    @IBAction func startButtonPress(_ sender: UIButton) {
        winningNumber = Int.random(in: 0...2)
        firstButton.isEnabled = true
        secondButton.isEnabled = true
        thirdButton.isEnabled = true
        resetCount.isEnabled = false
        changingTitle.text = "Guess the button !"
        self.view.backgroundColor = UIColor.systemBackground
        numberOfTriesLabel.textColor = .black
        winCountLabel.textColor = .black
        numberOfTries.textColor = .black
        winCount.textColor = .black
        loseCountLabel.textColor = .black
        loseCount.textColor = .black
    }
    
    @IBAction func resetCountTap(_ sender: UIButton) {
        let winningPercentage : Double = Double((wins * 100)/tries)
        changingTitle.text = "Your winning percentage is \(winningPercentage)%"
        tries = 0
        wins = 0
        loses = 0
        numberOfTries.text = String(0)
        winCount.text = String(0)
        loseCount.text = String(0)
        resetCount.isEnabled = false
    }
}

