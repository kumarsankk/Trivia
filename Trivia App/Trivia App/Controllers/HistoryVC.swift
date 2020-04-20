//
//  HistoryVC.swift
//  Trivia App
//
//  Created by Basith on 19/04/20.
//  Copyright © 2020 Sanjay. All rights reserved.
//

import UIKit
import CoreData

class HistoryVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var gameHistoryData = [NSManagedObject]()

    @IBOutlet weak var historyTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateHistoryData()
        historyTable.rowHeight = UITableView.automaticDimension
        historyTable.estimatedRowHeight = 200
    }
    
    func updateHistoryData(){
        gameHistoryData = theAppModel.sharedInstance.game
        if gameHistoryData.count == 0{
            showEmptyHistoryAlert()
        }
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        goBackToPreviuosVC()
    }
    // show alert if History Data Empty
    func showEmptyHistoryAlert(){
        let alertController = UIAlertController(title: "No History Data", message: "No Game Has Completed", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Take Me Back", style: .destructive, handler: { (alert: UIAlertAction!) -> Void in
            self.goBackToPreviuosVC()
        })
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    func goBackToPreviuosVC(){
        self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gameHistoryData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historycell", for: indexPath) as! HistoryCell
        let game = gameHistoryData[indexPath.row]
        cell.dateLabel.text = "GAME \(indexPath.row+1) : \(convertDateToString(date: (game.value(forKeyPath: "dateTime") as? Date)!))"
        cell.nameLabel.text = game.value(forKeyPath: "name") as? String
        cell.question1Label.text = game.value(forKeyPath: "question1") as? String
        cell.answer1Label.text = game.value(forKeyPath: "answer1") as? String
        cell.question2Label.text = game.value(forKeyPath: "question2") as? String
        cell.answer2Label.text = game.value(forKeyPath: "answer2") as? String
        return cell
    }
    // method for converting Date Object To String
    func convertDateToString(date: Date)->String{
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
class HistoryCell: UITableViewCell{
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var question1Label: UILabel!
    
    @IBOutlet weak var answer1Label: UILabel!
    
    @IBOutlet weak var question2Label: UILabel!
    
    @IBOutlet weak var answer2Label: UILabel!
}
