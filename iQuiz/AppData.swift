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
    open var seaQuestions: [String] = ["which city is big in WA"]
    open var chiQuestions: [String] = ["which city is big in CA?"]
    open var seaAnwers: [String] = ["lala", "ls", "df", "sd"]
    open var chiAnwers: [String] = ["wawa", "we", "sdaf", "sadf"]

}
