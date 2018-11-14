//
//  FinalViewController.swift
//  iQuiz
//
//  Created by Liuqing Ma on 11/4/18.
//  Copyright © 2018 Liuqing Ma. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {

    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var subject: UILabel!
    
    var finalScore = 0
    var subjectName = ""
    var text = ""
    var numOfQuestions = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (finalScore == numOfQuestions  ) {
            text = "Perfect!"
        } else if (finalScore > 0) {
            text = "Almost!"
        } else {
            text = "You need more practice!"
        }
        subject.text = subjectName
        subject.font = UIFont.boldSystemFont(ofSize: 20.0)
        score.numberOfLines = 2
        score.text = "\(text) \nYour final score is \(finalScore)/\(numOfQuestions)"
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        let firstVC = self.storyboard?.instantiateViewController(withIdentifier: "home") as! ViewController
        self.present(firstVC, animated: false, completion: nil)
    }
}
