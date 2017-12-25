//
//  QuestionBank.swift
//  Quizzler
//
//  Created by Rohan Joshi on 12/24/17.
//  Copyright © 2017 London App Brewery. All rights reserved.
//

import Foundation

// a class that holds the list of questions
// the quesion bank will contain a list of Question objects
class QuestionBank{
    var questions = [Question]()
    
    init(){
        self.questions.append(Question(text: "A butterfly has wings", correctAnswer: true))
        self.questions.append(Question(text: "The answer to life is 21", correctAnswer: false))
        self.questions.append(Question(text: "Tom Brady is the best Quarterback in the NFL", correctAnswer: true))
        self.questions.append(Question(text: "Thor is the strongest Avenger", correctAnswer: false))
        self.questions.append(Question(text: "The real Ellen Ripley dies in Alien 3", correctAnswer: true))
        self.questions.append(Question(text: "Manchester United sucks", correctAnswer: true))
        self.questions.append(Question(text: "ios development is fun", correctAnswer: true))
        self.questions.append(Question(text: "Valentine's day is banned in Saudi Arabia", correctAnswer: true))
        self.questions.append(Question(text: "Coffee is the best drink on this planet", correctAnswer: true))
        self.questions.append(Question(text: "Dota is not addictive", correctAnswer: false))
        self.questions.append(Question(text: "Kung Pao chicken is not tasty", correctAnswer: false))
        self.questions.append(Question(text: "A slug's blood is green", correctAnswer: true))
        self.questions.append(Question(text: "Red Bull gives you wings", correctAnswer: false))
        self.questions.append(Question(text: "the NFL referees know what they are doing", correctAnswer: false))
        self.questions.append(Question(text: "Sleeping in the afternoon is bad for you", correctAnswer: false))
        self.questions.append(Question(text: "The official anthem of LFC is 'You'll Never Walk Alone'", correctAnswer: true))
        self.questions.append(Question(text: "The new Star Wars movies are good", correctAnswer: false))
    }
}
