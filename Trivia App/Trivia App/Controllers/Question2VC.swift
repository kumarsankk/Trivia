//
//  Question2VC.swift
//  Trivia App
//
//  Created by Basith on 19/04/20.
//  Copyright © 2020 Sanjay. All rights reserved.
//

import UIKit

class Question2VC: UIViewController {
    
    //Labels
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1: UILabel!
    @IBOutlet weak var answer2: UILabel!
    @IBOutlet weak var answer3: UILabel!
    @IBOutlet weak var answer4: UILabel!
    //Buttons
    
    @IBOutlet weak var optionButton1: UIButton!
    @IBOutlet weak var optionButton2: UIButton!
    @IBOutlet weak var optionButton3: UIButton!
    @IBOutlet weak var optionButton4: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var answerArray = [String]()
    var answerText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        changeNextButtonStatus()
        // Do any additional setup after loading the view.
    }
    // change state of Next button According to data in AnswerArray
    private func changeNextButtonStatus(){
        if answerArray.count == 0{
            nextButton.isEnabled = false
            nextButton.alpha = 0.5
        }else{
            nextButton.isEnabled = true
            nextButton.alpha = 1
        }
    }
    @IBAction func option1Action(_ sender: UIButton) {
        // if button gets selected associated option will added in AnswerArray... else associated text removed from answerarray
        if sender.isSelected{
            sender.isSelected = false
            sender.setImage(UIImage(named : "uncheck"), for: .normal)
            if answerArray.contains(answer1.text!){
                answerArray = answerArray.filter { $0 != answer1.text! }
            }
        }else{
            sender.isSelected = true
            sender.setImage(UIImage(named : "tick"), for: .selected)
            if answerArray.contains(answer1.text!){
                print("element contains in namearray")
            }else{
                answerArray.append(answer1.text!)
            }
        }
        changeNextButtonStatus()
    }
    
    @IBAction func option2Action(_ sender: UIButton) {
        // if button gets selected associated option will added in AnswerArray... else associated text removed from answerarray
        if sender.isSelected{
            sender.isSelected = false
            sender.setImage(UIImage(named : "uncheck"), for: .normal)
            if answerArray.contains(answer2.text!){
                answerArray = answerArray.filter { $0 != answer2.text! }
            }
        }else{
            sender.isSelected = true
            sender.setImage(UIImage(named : "tick"), for: .selected)
            if answerArray.contains(answer2.text!){
                print("element contains in namearray")
            }else{
                answerArray.append(answer2.text!)
            }
        }
        changeNextButtonStatus()
    }
    
    @IBAction func option3Action(_ sender: UIButton) {
        // if button gets selected associated option will added in AnswerArray... else associated text removed from answerarray
        if sender.isSelected{
            sender.isSelected = false
            sender.setImage(UIImage(named : "uncheck"), for: .normal)
            if answerArray.contains(answer3.text!){
                answerArray = answerArray.filter { $0 != answer3.text! }
            }
        }else{
            sender.isSelected = true
            sender.setImage(UIImage(named : "tick"), for: .selected)
            if answerArray.contains(answer3.text!){
                print("element contains in namearray")
            }else{
                answerArray.append(answer3.text!)
            }
        }
        changeNextButtonStatus()
    }
    
    @IBAction func option4Action(_ sender: UIButton) {
        // if button gets selected associated option will added in AnswerArray... else associated text removed from answerarray
        if sender.isSelected{
            sender.isSelected = false
            sender.setImage(UIImage(named : "uncheck"), for: .normal)
            if answerArray.contains(answer4.text!){
                answerArray = answerArray.filter { $0 != answer4.text! }
            }
        }else{
            sender.isSelected = true
            sender.setImage(UIImage(named : "tick"), for: .selected)
            if answerArray.contains(answer4.text!){
                print("element contains in namearray")
            }else{
                answerArray.append(answer4.text!)
            }
        }
        changeNextButtonStatus()
    }
    
    @IBAction func nextAction(_ sender: Any) {
        answerText = ""
        // concatenate texts in answerarray
        for answer in answerArray{
            answerText += answer + ","
        }
        answerText = String(answerText.dropLast())
        theAppModel.sharedInstance.gameObject!.setAnswer2(answerObj: answerText)
        goToSummaryVc()
    }

    func goToSummaryVc(){
        let questionVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "summaryvc") as? SummaryVC
        self.navigationController?.pushViewController(questionVc!, animated: true)
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
