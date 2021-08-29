//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    let quizQuestions = [
        ["Four + Two is equal to Six", "True"],
        ["Five - Three is greater than One", "True"],
        ["Three + Eight is less than Ten", "False"]
    ]
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateQuizUI()
    }

    @IBAction func answerPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle // True, False
        let answer = quizQuestions[questionNumber][1]
        
        if userAnswer == answer {
            print("Right")
        } else {
            print("Wrong")
        }
        
        if questionNumber + 1 != quizQuestions.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        updateQuizUI()
    }
    
    func updateQuizUI() {
        questionLabel.text = quizQuestions[questionNumber][0]
    }
    
}

