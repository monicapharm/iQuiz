//
//  AppData.swift
//  iQuiz
//
//  Created by Liuqing Ma on 10/29/18.
//  Copyright © 2018 Liuqing Ma. All rights reserved.
//

import UIKit

// the below is no longer needed as we read from JSON file directly

class AppData: NSObject {
    
    static let shared = AppData()
    
    open var subjects: [String] = ["Art", "Science", "Music"]
    
    open var descr: [String] = ["Test your knowledge on art!", "Test your knowledge on science!", "Test your knowledge on music!"]
    
    open var images = [UIImage(named: "art"), UIImage(named: "science"), UIImage(named: "music")]
    
    open var topicIdx = 0
    
    struct Question {
        var subject: String
        var question : String
        var answers : [String]
        var correctAnswer : String
    }
    
    let allQuiz = [
        Question(subject: "Art", question: "Mixing the colors blue and red in equal proportion will produce which of the following hues?", answers: ["A. Maroon", "B. Violet", "C. Orange", "D. Brown"], correctAnswer: "B. Violet"),
        Question(subject: "Science", question: "Which of the following is a non metal that remains liquid at room temperature?", answers: ["A. Phosphorous", "B. Chlorine", "C. Helium", "D. Bromine"], correctAnswer: "D. Bromine"),
        Question(subject: "Music", question: "What symphony's last movement includes a setting of Schiller's poem 'Hymn to Joy'?", answers: ["A. Beethoven's Ninth", "B. Bruckner's Eight", "C. Mahler's Tenth", "D. Mozart's 40th"], correctAnswer: "A. Beethoven's Ninth"),
        Question(subject: "Art", question: "The use of which of the following camera filters most likely contributed to the vivid color of the sky in the photograph?", answers: ["A. UV", "B. diffusion", "C. polarizing", "D. neutral density"], correctAnswer: "C. polarizing"),
        Question(subject: "Science", question: "The average salinity of sea water is:", answers: ["A. 3%", "B. 3.5%", "C. 2.5%", "D. 2%"], correctAnswer: "B. 3.5%"),
        Question(subject: "Music", question: "What band leader was known as 'the King of Swing'?", answers: ["A. Tommy Dorsey", "B. Benny Goodman", "C. Guy Lombardo", "D. Glenn Miller"], correctAnswer: "B. Benny Goodman")
    ]
}
