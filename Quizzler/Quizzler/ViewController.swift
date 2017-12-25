//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    var questionNumber: Int = 0
    var score: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    // load the first question in the question bank on loading of the app
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nextQuestion()
    }

    // check if the answer is correct or wrong
    // update the score
    // update the progress elements
    // go to the next question
    @IBAction func answerPressed(_ sender: AnyObject) {
        if(sender.tag == 1){
            self.pickedAnswer = true
        }else if(sender.tag == 2){
            self.pickedAnswer = false
        }
        checkAnswer()
        self.questionNumber = self.questionNumber + 1
        nextQuestion()
    }
    
    
    func updateUI() {
        scoreLabel.text = String(self.score)
        progressLabel.text = "\(self.questionNumber + 1) / 13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
    }
    

    // guide the user to either end or restart the quiz
    func nextQuestion() {
        if(self.questionNumber) <= 12{
            questionLabel.text = allQuestions.questions[self.questionNumber].question
            self.updateUI()
        }else{
            let alert = UIAlertController(title: "Awesome", message: "You have reached the end of the quiz!", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    // check if the chosen answer is correct or wrong
    // if the answer is correct, the score increases
    // if the answer is wrong, the score remains the same
    func checkAnswer() {
        let correctAnswer = allQuestions.questions[self.questionNumber].answer
        if correctAnswer == self.pickedAnswer{
            ProgressHUD.showSuccess("Correct")
            self.score = self.score + 1
        }else{
            ProgressHUD.showError("Wrong!")
        }
    }
    
    // restart the quiz
    // reset the counters
    func startOver() {
        self.questionNumber = 0
        self.score = 0
        self.nextQuestion()
    }
    

    
}
