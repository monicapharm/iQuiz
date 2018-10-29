//
//  QuizTableViewCell.swift
//  iQuiz
//
//  Created by Liuqing Ma on 10/28/18.
//  Copyright © 2018 Liuqing Ma. All rights reserved.
//

import UIKit

class QuizTableViewCell: UITableViewCell {

    @IBOutlet weak var quizImage: UIImageView!
    
    @IBOutlet weak var quizTitle: UILabel!
    
    @IBOutlet weak var quizDescription: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
