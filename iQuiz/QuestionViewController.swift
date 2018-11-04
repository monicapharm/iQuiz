//
//  QAViewController.swift
//  iQuiz
//
//  Created by Liuqing Ma on 10/29/18.
//  Copyright © 2018 Liuqing Ma. All rights reserved.
//

import UIKit

class QAViewController: UIViewController {
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var submitBtn: UIButton!
    
    var pressedTime = 0
    var appdata = AppData.shared
    var guessed = ""
    var idx = 0
    var totalAnswered = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newQuestion()
    }
    
    func newQuestion() {
        question.numberOfLines = 3
        idx = appdata.topicIdx + totalAnswered * 3
        question.text = appdata.allQuiz[idx].question
        btn1.setTitle(appdata.allQuiz[idx].answers[0], for: .normal)
        btn2.setTitle(appdata.allQuiz[idx].answers[1], for: .normal)
        btn3.setTitle(appdata.allQuiz[idx].answers[2], for: .normal)
        btn4.setTitle(appdata.allQuiz[idx].answers[3], for: .normal)
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
        thirdVC.guessed = guessed
        thirdVC.que = appdata.allQuiz[idx].question
        thirdVC.ans = appdata.allQuiz[idx].correctAnswer
        thirdVC.totalAnswered = totalAnswered
        self.present(thirdVC, animated: false, completion: nil)
    }
    
}
