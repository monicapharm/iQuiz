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
    
    var appdata = AppData.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newQuestion()
    }
    
    func newQuestion() {
        switch appdata.topicIdx {
        case 0:
                question.text = appdata.seaQuestions[0]
                btn1.setTitle(appdata.seaAnwers[0], for: .normal)
                btn2.setTitle(appdata.seaAnwers[1], for: .normal)
                btn3.setTitle(appdata.seaAnwers[2], for: .normal)
                btn4.setTitle(appdata.seaAnwers[3], for: .normal)
        default:
                question.text = appdata.chiQuestions[0]
                btn1.setTitle(appdata.chiAnwers[0], for: .normal)
                btn2.setTitle(appdata.chiAnwers[1], for: .normal)
                btn3.setTitle(appdata.chiAnwers[2], for: .normal)
                btn4.setTitle(appdata.chiAnwers[3], for: .normal)
        }
    }

    @IBAction func btnBackPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueBackHome", sender: self)
    }
    
}
