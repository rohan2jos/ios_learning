//
//  Question.swift
//  Quizzler
//
//  Created by Rohan Joshi on 12/24/17.
//  Copyright © 2017 London App Brewery. All rights reserved.
//

import Foundation

class Question{

    let question: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool){
        self.question = text
        self.answer = correctAnswer
    }
}
