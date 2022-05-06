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
    func winningCheck(number : Int) {
        if number == winningNumber {
            changingTitle.text = "You win !\n\n🎉🎉🎉"
            firstButton.isEnabled = false
            secondButton.isEnabled = false
            thirdButton.isEnabled = false
        } else {
            changingTitle.text = "You lose !"
            firstButton.isEnabled = false
            secondButton.isEnabled = false
            thirdButton.isEnabled = false
        }
    }
    
    @IBAction func firstButtonTap(_ sender: UIButton) {
        let firstButtonNumber = Int.random(in: 0...2)
        self.view.backgroundColor = UIColor.systemCyan
        winningCheck(number: firstButtonNumber)
        
    }
    
    @IBAction func secondButtonTap(_ sender: UIButton) {
        let secondButtonNumber = Int.random(in: 0...2)
        self.view.backgroundColor = UIColor.systemMint
        winningCheck(number: secondButtonNumber)
    }
    
    
    @IBAction func thirdButtonPress(_ sender: UIButton) {
        let thirdButtonNumber = Int.random(in: 0...2)
        self.view.backgroundColor = UIColor.systemTeal
        winningCheck(number: thirdButtonNumber)
    }
    
    @IBAction func startButtonPress(_ sender: UIButton) {
        winningNumber = Int.random(in: 0...2)
        firstButton.isEnabled = true
        secondButton.isEnabled = true
        thirdButton.isEnabled = true
        changingTitle.text = "Guess the button !"
        self.view.backgroundColor = UIColor.systemBackground
    }
}

