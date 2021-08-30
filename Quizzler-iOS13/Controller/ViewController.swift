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
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateQuizUI()
        setProgress()
    }

    @IBAction func answerPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle! // True, False
        let answeredCorrectly = quizBrain.checkAnswer(userAnswer)
        
        if answeredCorrectly {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(updateQuizUI), userInfo:nil, repeats: false)
        
        quizBrain.getNextQuestion()
    }
    
    @objc func updateQuizUI() {
        setProgress()
        setScore()
        questionLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
    func setProgress() {
        progressBar.progress = quizBrain.getProgress()
    }
    
    func setScore() {
        let score = quizBrain.calculateScore()
        scoreLabel.text = "Score: \(score)"
    }
    
}

