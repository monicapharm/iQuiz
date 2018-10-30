//
//  ViewController.swift
//  iQuiz
//
//  Created by Liuqing Ma on 10/28/18.
//  Copyright © 2018 Liuqing Ma. All rights reserved.
//

import UIKit

//class Quiz {
//    let subjects = ["Art", "Science", "Music"]
//    let description = ["Quiz on Art", "Quiz on Science", "Quiz on Music"]
//    let images = [UIImage(named: "art"), UIImage(named: "science"), UIImage(named: "music")]
//}

class QuizDataSource : NSObject, UITableViewDataSource {
    
//    init(quiz: Quiz){
//        self.quiz = quiz
//    }
    
    // var quiz = AppData.shared
    
    let quiz: AppData
    
    init(quiz: AppData){
        self.quiz = quiz
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quiz.subjects.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell") as! QuizTableViewCell
        cell.quizTitle.text = quiz.subjects[indexPath.row]
        cell.quizDescription.text = quiz.descr[indexPath.row]
        cell.quizImage.image = quiz.images[indexPath.row]
        return cell
    }
    
}

class ViewController: UIViewController, UITableViewDelegate {

    var appdata = AppData.shared

    @IBAction func settings(_ sender: Any) {
        let uiAlert = UIAlertController(title: "Settings", message: "Check back for settings!", preferredStyle: .alert)
        uiAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(uiAlert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        appdata.topicIdx = indexPath.row
        performSegue(withIdentifier: "segueGoToQuestion", sender: self)
    }
    
    let dataSource = QuizDataSource(quiz: AppData())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = dataSource
        tableView.delegate = self
    }

}

