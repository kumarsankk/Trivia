//
//  Game.swift
//  Trivia App
//
//  Created by Basith on 19/04/20.
//  Copyright © 2020 Sanjay. All rights reserved.
//

import Foundation
import UIKit

class Game{
    var date: Date?
    var name: String?
    var question1: String?
    var question2: String?
    var answer1: String?
    var answer2: String?
    
    init() {
        date = Date()
        name = ""
        question1 = "Who is the best cricketer in the world?"
        question2 = "What are the colors in the national flag?"
        answer1 = ""
        answer2 = ""
    }
    // set Methods for Game Variables
    func setDate(dateObj: Date){
        date = dateObj
    }
    func setName(nameObj: String){
        name = nameObj
    }
    func setQuestion1(questionObj: String){
        question1 = questionObj
    }
    func setQuestion2(questionObj: String){
        question2 = questionObj
    }
    func setAnswer1(answerObj: String){
        answer1 = answerObj
    }
    func setAnswer2(answerObj: String){
        answer2 = answerObj
    }
    // get Methods for Game Variables
    func getDate()->Date{
        return date!
    }
    func getName()->String{
        return name!
    }
    func getQuestion1()->String{
        return question1!
    }
    func getQuestion2()->String{
        return question2!
    }
    func getAnswer1()->String{
        return answer1!
    }
    func getAnswer2()->String{
        return answer2!
    }
    func getGameObject()->Game{
        return self
    }
}
