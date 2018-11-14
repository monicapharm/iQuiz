//
//  QAViewController.swift
//  iQuiz
//
//  Created by Liuqing Ma on 10/29/18.
//  Copyright © 2018 Liuqing Ma. All rights reserved.
//

import UIKit

class QAViewController: UIViewController {
    
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var submitBtn: UIButton!
    
    var jsonData: [Quiz]? = nil
    var categoryIndex: Int = -1
    var pressedTime = 0
    var guessed = ""
    var totalAnswered = 0
    var score = 0
    var currentQuestion = 0
    var correctAns = 0
    var numOfQuestions = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newQuestion()
    }
    
    func newQuestion() {
        question.numberOfLines = 3
        subject.text = jsonData?[categoryIndex].title
        subject.font = UIFont.boldSystemFont(ofSize: 20.0)
        question.text = jsonData?[categoryIndex].questions[currentQuestion].text
        question.font = UIFont.italicSystemFont(ofSize: 18.0)
        numOfQuestions = (jsonData?[categoryIndex].questions.count)!
        print(categoryIndex)
        print(currentQuestion)
        btn1.setTitle(jsonData?[categoryIndex].questions[currentQuestion].answers[0], for: .normal)
        btn2.setTitle(jsonData?[categoryIndex].questions[currentQuestion].answers[1], for: .normal)
        btn3.setTitle(jsonData?[categoryIndex].questions[currentQuestion].answers[2], for: .normal)
        btn4.setTitle(jsonData?[categoryIndex].questions[currentQuestion].answers[3], for: .normal)
        correctAns = Int((jsonData?[categoryIndex].questions[currentQuestion].answer)!)!
    }
    
    func clearAnswer() {
        if (pressedTime == 1) {
            btn1.setTitleColor(UIView().tintColor, for: .normal)
            btn2.setTitleColor(UIView().tintColor, for: .normal)
            btn3.setTitleColor(UIView().tintColor, for: .normal)
            btn4.setTitleColor(UIView().tintColor, for: .normal)
            pressedTime = 0
        }
    }
    @IBAction func btn1Pressed(_ sender: Any) {
        clearAnswer()
        btn1.setTitleColor(.red, for: .normal)
        pressedTime += 1
        guessed = btn1.title(for: .normal)!
    }
    
    @IBAction func btn2Pressed(_ sender: Any) {
        clearAnswer()
        btn2.setTitleColor(.red, for: .normal)
        pressedTime += 1
        guessed = btn2.title(for: .normal)!
    }
    
    @IBAction func btn3Pressed(_ sender: Any) {
        clearAnswer()
        btn3.setTitleColor(.red, for: .normal)
        pressedTime += 1
        guessed = btn3.title(for: .normal)!
    }
    
    @IBAction func btn4Pressed(_ sender: Any) {
        clearAnswer()
        btn4.setTitleColor(.red, for: .normal)
        pressedTime += 1
        guessed = btn4.title(for: .normal)!
    }
    
    @IBAction func btnBackPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueBackHome", sender: self)
    }
    
    @IBAction func submitBtnPressed(_ sender: Any) {
        totalAnswered += 1
        let thirdVC = self.storyboard?.instantiateViewController(withIdentifier: "answer") as! AnswerViewController
        thirdVC.subjectName = (jsonData?[categoryIndex].title)!
        thirdVC.guessed = guessed
        thirdVC.que = question.text!
        thirdVC.ans = correctAns
        thirdVC.totalAnswered = totalAnswered
        thirdVC.score = score
        thirdVC.curQue = currentQuestion
        thirdVC.categoryIndex = categoryIndex
        thirdVC.jsonData = jsonData
        thirdVC.numOfQuestions = numOfQuestions
        self.present(thirdVC, animated: false, completion: nil)
    }

}
