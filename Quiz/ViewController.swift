//
//  ViewController.swift
//  Quiz
//
//  Created by Naiara Soares Moreira on 08/01/2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var bgView: UIView!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var answerInput: UITextField!
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
        Question(id: 1, question: "1 + 1", answer: "2"),
        Question(id: 2, question: "9 * 9", answer: "81"),
        Question(id: 3, question: "81 - 80", answer: "1")
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
        }
    }
    
    
    @IBAction func checkBtn(_ sender: UIButton) {
        if answerInput.text == currentQuestion?.answer {
            answerLabel.text = "Correct: \(currentQuestion!.answer)"
            changeBgColor(color: .systemGreen)
            isCorrect = true
        } else if answerInput.text == "" {
            return
        } else {
            answerLabel.text = "Wrong answer"
            changeBgColor(color: .systemRed)
            isCorrect = false
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
    
    func getQuestion() {
        if index == questions.count {
            showAlert(title: "Congratulations", message: "You completed the quiz. Thanks for playing.", btnTitle: "Restart")
            index = 0
        } else {
            currentQuestion = questions[index]
            questionLabel.text = currentQuestion?.question
            isCorrect = false
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
    
    
    
}

