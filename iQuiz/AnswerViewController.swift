//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Liuqing Ma on 11/4/18.
//  Copyright © 2018 Liuqing Ma. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var rightOrWrong: UILabel!
    
    var que = ""
    var ans = ""
    var guessed = ""
    var result = ""
    var totalAnswered = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        question.numberOfLines = 3
        question.text = que
        answer.text = ans
        if (ans == guessed) {
            result = "Your answer is \(guessed). \n  Congrats! You're right!"
        } else {
            result = "Your answer is \(guessed). \n  Opps...You are wrong."
        }
        rightOrWrong.numberOfLines = 2
        rightOrWrong.text = result
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        let firstVC = self.storyboard?.instantiateViewController(withIdentifier: "home")as! ViewController
        self.present(firstVC, animated: false, completion: nil)
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "question") as!QAViewController
        secondVC.totalAnswered = self.totalAnswered
        self.present(secondVC, animated: false, completion: nil)
    }
}
