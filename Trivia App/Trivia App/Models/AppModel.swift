//
//  AppModel.swift
//  Trivia App
//
//  Created by Basith on 19/04/20.
//  Copyright © 2020 Sanjay. All rights reserved.
//

import Foundation
import UIKit
import CoreData

public class theAppModel{
    public static let sharedInstance = theAppModel()
    var gameObject: Game?
    var game: [NSManagedObject] = []
    func modelInit(){
        gameObject = Game()
        initializeLocalDB()
    }
    func initializeLocalDB(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
          return
        }

        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "GAME")

        do {
          game = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    func save(name: String, date: Date, question1: String, answer1: String, question2: String, answer2: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "GAME", in: managedContext)!
        let gameEntity = NSManagedObject(entity: entity, insertInto: managedContext)
        gameEntity.setValue(date, forKeyPath: "dateTime")
        gameEntity.setValue(name, forKeyPath: "name")
        gameEntity.setValue(question1, forKeyPath: "question1")
        gameEntity.setValue(answer1, forKeyPath: "answer1")
        gameEntity.setValue(question2, forKeyPath: "question2")
        gameEntity.setValue(answer2, forKeyPath: "answer2")
        
        do {
            try managedContext.save()
            game.append(gameEntity)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
