//
//  SummaryVC.swift
//  Trivia App
//
//  Created by Basith on 19/04/20.
//  Copyright © 2020 Sanjay. All rights reserved.
//

import UIKit

class SummaryVC: UIViewController {
    // Labels
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var question1Label: UILabel!
    @IBOutlet weak var answer1Label: UILabel!
    @IBOutlet weak var question2Label: UILabel!
    @IBOutlet weak var answer2Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getGameResults()
        // Do any additional setup after loading the view.
    }
    // fetch data from SingletonClass
    func getGameResults(){
        nameLabel.text = "Hello \(theAppModel.sharedInstance.gameObject!.getName()),"
        question1Label.text = theAppModel.sharedInstance.gameObject!.getQuestion1()
        answer1Label.text = "Answer: "+theAppModel.sharedInstance.gameObject!.getAnswer1()
        question2Label.text = theAppModel.sharedInstance.gameObject!.getQuestion2()
        answer2Label.text = "Answer: "+theAppModel.sharedInstance.gameObject!.getAnswer2()
    }
    @IBAction func finishAction(_ sender: Any) {
        // save current data in localDB
        theAppModel.sharedInstance.save(name: nameLabel.text!, date: theAppModel.sharedInstance.gameObject!.getDate(), question1: theAppModel.sharedInstance.gameObject!.getQuestion1(), answer1: theAppModel.sharedInstance.gameObject!.getAnswer1(), question2: theAppModel.sharedInstance.gameObject!.getQuestion2(), answer2: theAppModel.sharedInstance.gameObject!.getAnswer2())
        // go back to Main Vc
        goToMainVc()
    }
    @IBAction func summaryAction(_ sender: Any) {
        goToHistory()
    }
    func goToMainVc(){
        let mainVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainvc") as? MainVC
        self.navigationController?.pushViewController(mainVc!, animated: true)
    }
    func goToHistory(){
        let historyVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "historyvc") as? HistoryVC
        self.navigationController?.pushViewController(historyVc!, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
