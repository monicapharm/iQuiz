//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Liuqing Ma on 11/4/18.
//  Copyright © 2018 Liuqing Ma. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var rightOrWrong: UILabel!
    
    var subjectName = ""
    var que = ""
    var ans = ""
    var guessed = ""
    var totalAnswered = 0
    var score = 0
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subject.text = subjectName
        subject.font = UIFont.boldSystemFont(ofSize: 20.0)
        question.numberOfLines = 3
        question.text = que
        question.font = UIFont.italicSystemFont(ofSize: 15.0)
        answer.text = ans
        answer.textColor = UIColor.orange
        if (ans == guessed) {
            score += 1
            result = "Your answer is \(guessed). \n  Congrats! You're right!"
        } else {
            result = "Your answer is \(guessed). \n  Opps...You are wrong."
        }
        rightOrWrong.numberOfLines = 2
        rightOrWrong.text = result
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        let firstVC = self.storyboard?.instantiateViewController(withIdentifier: "home") as! ViewController
        self.present(firstVC, animated: false, completion: nil)
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        if (totalAnswered < 2) {
            let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "question") as! QAViewController
            secondVC.totalAnswered = self.totalAnswered
            secondVC.score = score
            self.present(secondVC, animated: false, completion: nil)
        } else {
            let fourthVC = self.storyboard?.instantiateViewController(withIdentifier: "final") as! FinalViewController
            fourthVC.finalScore = score
            fourthVC.subjectName = subjectName
            self.present(fourthVC, animated: false, completion: nil)
        }
    }
}
