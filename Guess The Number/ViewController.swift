//
//  ViewController.swift
//  Guess The Number
//
//  Created by Kaihan Roman on 1/23/18.
//  Copyright © 2018 kay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    
    let lowerBound : UInt32 = 1
    let upperBound : UInt32 = 100
    var numberToGuess: Int! //? = optional; ! = implicitly unwrapped optional
    var numberOfGuesses = 0
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        if let guess = guessTextField.text {
            if let guessedInt = Int(guess) { //may not cast to Int so we say if let;
                numberOfGuesses += 1
                validateGuess(guessedInt)
                print(guessedInt)
            }
        }
    }
    
    func validateGuess(_ guess: Int) {
        if (guess > upperBound || guess < lowerBound) {
            showAlert(title: "invalid Number", message: "Your number is invalid. It should be should be between \(lowerBound) and \(upperBound)", buttonText: "OK")
        }
        if (guess < numberToGuess) {
            print("guess higher next time")
            guessLabel.text = "Guess higher next time!"
        } else if (guess > numberToGuess) {
            print("guess lower next time")
            guessLabel.text = "Guess lower next time!"
        } else {
            print ("you won")
            showAlert(title: "Congrats 😢", message: "You won within a total of \(numberOfGuesses) guesses!", buttonText: "Play Again!")
            numberOfGuesses = 0
            generateRandomNumber()
        }
    }
    
    func showAlert(title: String, message: String, buttonText: String) { // underscore means
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: buttonText, style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    func generateRandomNumber() {
        numberToGuess = Int(arc4random_uniform(upperBound) + lowerBound) //this method needs UInt32 as args
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomNumber()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

}

