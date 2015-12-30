//
//  Question.swift
//  VGTrivia
//
//  Created by Diego Salazar on 12/30/15.
//  Copyright © 2015 Diego Salazar. All rights reserved.
//

import Foundation

class Question {
    
    var question: String
    var answers: [String]
    var rightAnswer: Int
    
    init(question:String, answer1:String, answer2:String, answer3:String, answer4:String, rightAnswer: Int) {
        self.question = question
        self.answers = [answer1, answer2, answer3, answer4]
        self.rightAnswer = rightAnswer
    }
    
}