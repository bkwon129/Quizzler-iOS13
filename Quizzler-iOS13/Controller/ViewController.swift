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
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateQuizUI()
        setProgress()
    }

    @IBAction func answerPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle! // True, False
        quizBrain.checkAnswer(userAnswer)
        
        if userAnswer == answer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(updateQuizUI), userInfo:nil, repeats: false)
        
        if questionNumber + 1 != quizQuestions.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    @objc func updateQuizUI() {
        setProgress()
        questionLabel.text = quizQuestions[questionNumber].text
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
    func setProgress() {
        progressBar.progress = Float(questionNumber + 1) / Float(quizQuestions.count)
    }
    
}

