//
//  Question.swift
//  Quizzler
//
//  Created by Omar Gonzalez on 6/3/19.
//
//

import Foundation

class Question{
    let questionText : String
    let answer : Bool
    
    init(text :string, correctAnswer : Bool) {
        questionText = text
        answer = correctAnswer
    }
}
