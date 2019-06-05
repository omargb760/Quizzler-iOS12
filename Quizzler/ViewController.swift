//
//  ViewController.swift
//  Quizzler
//
//  Created by Omar Gonzalez on 5/21/2019.
//  London App Brewery, for tutorial purposes. 
//

import UIKit

class ViewController: UIViewController {
    
    //instance variables
    let allQuestions = QuestionBank()
    var pickedAnswers : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1 {
            pickedAnswers = true
        }
        else{
            pickedAnswers = false
        }
        
        checkAnswer()
        questionNumber = questionNumber + 1
        updateUI()
        
    }
    
    
    func updateUI() {
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber)
        progressLabel.text = String(questionNumber) + "/13"
        scoreLabel.text = "score: " + String(score)
        nextQuestion()
    }
    

    func nextQuestion() {
        if questionNumber <= 12{
            questionLabel.text = allQuestions.list[questionNumber].questionText
        }
        else{
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { UIAlertAction in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswers {
            
            ProgressHUD.showSuccess("Correct!")
            
            score = score + 1
        }
        else {
            
            ProgressHUD.showError("Wrong!")
        }
    }
    
    
    func startOver() {
        questionNumber = 0
        score = 0
        
        updateUI()
    }
    

    
}
