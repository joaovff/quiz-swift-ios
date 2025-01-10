//
//  ViewController.swift
//  Quiz
//
//  Created by João Figueiredo Silva on 08/01/2025.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var bgView: UIView!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var answerInput: UITextField!
    @IBOutlet weak var nextQuestionBtn: UIButton!
    @IBOutlet weak var questionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        getQuestion()
    }
    
    struct Question {
        var id: Int
        var question: String
        var answer: String
    }
    
    let questions: [Question] = [
        Question(id: 0,question: "3 * 3", answer: "9"),
        Question(id: 1, question: "9 *  5", answer: "45"),
        Question(id: 2, question: "45 + 15", answer: "60"),
        Question(id: 3, question: "60 / 2", answer: "30")
    ]
    
    
    var currentQuestion: Question?
    var isCorrect = false
    
    var index:Int = 0 {
        willSet {
            answerLabel.text = ""
            changeBgColor(color: .systemBackground)
            answerInput.text = ""
        } didSet {
            getQuestion()
            
            if index == questions.count - 1 {
                nextQuestionBtn.setTitle("Finish", for: .normal)
            } else {
                nextQuestionBtn.setTitle("Next Question", for: .normal)
            }
        }
    }
    
    func getQuestion() {
        if index == questions.count {
            showAlert(title: "Congratulations", message: "You completed the quiz. Thanks for playing.", btnTitle: "Restart")
            index = 0
        } else {
            currentQuestion = questions[index]
            questionLabel.text = currentQuestion?.question
            isCorrect = false
        }
        
        nextQuestionBtn.isEnabled = false
    }
    
    @IBAction func checkBtn(_ sender: UIButton) {
        if answerInput.text == currentQuestion?.answer {
            answerLabel.text = "Correct: \(currentQuestion!.answer)!"
            changeBgColor(color: .systemGreen)
            isCorrect = true
        } else if answerInput.text == "" {
            return
        } else {
            answerLabel.text = "Wrong answer"
            changeBgColor(color: .systemRed)
            isCorrect = false
        }
        
        if isCorrect {
            toggleNextQuestionBtn(button: nextQuestionBtn)
        }
    }

    @IBAction func showAnswerBtn(_ sender: UIButton) {
        showAlert(title: "", message: currentQuestion!.answer, btnTitle: "Got it!")
    }
    
    @IBAction func nextQuestionBtn(_ sender: UIButton) {
        if isCorrect == true {
            index += 1
        }
    }
    
    func changeBgColor(color: UIColor) {
        bgView.backgroundColor = color
    }
    
    func showAlert(title: String, message: String, btnTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: btnTitle, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func toggleNextQuestionBtn(button: UIButton) {
        button.isEnabled = !false
    }
    
}

