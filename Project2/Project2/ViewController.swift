//
//  ViewController.swift
//  Project2
//
//  Created by Harrison Dutson on 9/24/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionNumber = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        questionNumber += 1
        
        if questionNumber == 11 {
            score = 0
            questionNumber = 0
        }
        
        title = "\(countries[correctAnswer].uppercased()) Score \(score)"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var wrongAnswer: String
        
        var ac = UIAlertController(title: "", message: "Your score is \(score)", preferredStyle: .alert)

        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        } else {
            title = "Wrong"
            wrongAnswer = countries[sender.tag]
            score -= 1
            ac = UIAlertController(title: title, message: "You chose \(wrongAnswer) \n Your score is \(score)", preferredStyle: .alert)
        }
        
        
        if questionNumber == 10 {
            ac.addAction(UIAlertAction(title: "Finnish", style: .default, handler: askQuestion))
        } else {
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        }
        
        
        present(ac, animated: true)
    }
}

