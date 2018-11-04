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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (finalScore == 0) {
            text = "You need more practice!"
        } else if (finalScore == 1) {
            text = "Almost!"
        } else {
            text = "Perfect!"
        }
        subject.text = subjectName
        subject.font = UIFont.boldSystemFont(ofSize: 20.0)
        score.numberOfLines = 2
        score.text = "\(text) \nYour final score is \(finalScore)/2"
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        let firstVC = self.storyboard?.instantiateViewController(withIdentifier: "home") as! ViewController
        self.present(firstVC, animated: false, completion: nil)
    }
}