//
//  AppData.swift
//  iQuiz
//
//  Created by Liuqing Ma on 10/29/18.
//  Copyright © 2018 Liuqing Ma. All rights reserved.
//

import UIKit

class AppData: NSObject {
    
    static let shared = AppData()
    open var subjects: [String] = ["Art", "Science", "Music"]
    open var descr: [String] = ["Quiz on Art", "Quiz on Science", "Quiz on Music"]
    open var images = [UIImage(named: "art"), UIImage(named: "science"), UIImage(named: "music")]
    
    open var topicIdx = 0
    open var artQuestions: [String] = ["Mixing the colors blue and red in equal proportion will produce which of the following hues?"]
    open var sciQuestions: [String] = ["Which of the following is a non metal that remains liquid at room temperature?"]
    open var musicQuestions: [String] = ["What symphony's last movement includes a setting of Schiller's poem 'Hymn to Joy'?"]
    
    open var artAnwers: [String] = ["A. Maroon", "B. Violet", "C. Orange", "D. Brown"]
    open var sciAnwers: [String] = ["A. Phosphorous", "B. Chlorine", "C. Helium", "D. Bromine"]
    open var musicAnwers: [String] = ["A. Beethoven's Ninth ", "B. Bruckner's Eight", "C. Mahler's Tenth", "D. Mozart's 40th"]
    
    struct Question {
        var question : String
        var answers : [String]
        var correctAnswer : String
    }
    
    let allQuiz = [
        Question(question: "Mixing the colors blue and red in equal proportion will produce which of the following hues?", answers: ["A. Maroon", "B. Violet", "C. Orange", "D. Brown"], correctAnswer: "B. Violet"),
        Question(question: "Which of the following is a non metal that remains liquid at room temperature?", answers: ["A. Phosphorous", "B. Chlorine", "C. Helium", "D. Bromine"], correctAnswer: "D. Bromine"),
        Question(question: "What symphony's last movement includes a setting of Schiller's poem 'Hymn to Joy'?", answers: ["A. Beethoven's Ninth", "B. Bruckner's Eight", "C. Mahler's Tenth", "D. Mozart's 40th"], correctAnswer: "A. Beethoven's Ninth"),
        
        Question(question: "During summer vacation, Tim's brother earned money mowing the neighbor's lawn. He can mow 6 lawns an hour and has 21 laws left to mow. How long will it take him to finish?", answers: ["1.5", "2.5", "3.5", "4.5"], correctAnswer: "3.5"),
        Question(question: "Steve's mom bought him a 1 year swimming pass for $390. She decided to make monthly payments. How much would she need to pay per month?", answers: ["25.50", "27.75", "30.00", "32.50"], correctAnswer: "32.50")
    ]
}

//class Quiz {
//    let subjects = ["Art", "Science", "Music"]
//    let description = ["Quiz on Art", "Quiz on Science", "Quiz on Music"]
//    let images = [UIImage(named: "art"), UIImage(named: "science"), UIImage(named: "music")]
//}
