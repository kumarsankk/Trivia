//
//  Question1Vc.swift
//  Trivia App
//
//  Created by Basith on 19/04/20.
//  Copyright © 2020 Sanjay. All rights reserved.
//

import UIKit

class Question1Vc: UIViewController {

    // Labels
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answer1: UILabel!
    @IBOutlet weak var answer2: UILabel!
    @IBOutlet weak var answer3: UILabel!
    @IBOutlet weak var answer4: UILabel!
    
    // Buttons
    @IBOutlet weak var optionButton1: UIButton!
    @IBOutlet weak var optionButton2: UIButton!
    @IBOutlet weak var optionButton3: UIButton!
    @IBOutlet weak var optionButton4: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var buttonsArray = [UIButton]()
    var selectedOption = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonsArray.append(optionButton1)
        buttonsArray.append(optionButton2)
        buttonsArray.append(optionButton3)
        buttonsArray.append(optionButton4)
        nextButton.isEnabled = false
        nextButton.alpha = 0.6
        // Do any additional setup after loading the view.
    }
    // option selection logic
    @IBAction func optionButtonHandler(_ sender: UIButton) {
        for button in buttonsArray {
            button.isSelected = false
        }
        sender.isSelected = true
        sender.setImage(UIImage(named: "tick"), for: .selected)
        sender.imageView?.contentMode = .scaleAspectFit
        switch sender.tag {
        case 111:
            selectedOption = answer1.text!
            self.enableNextButton()
        case 112:
            selectedOption = answer2.text!
            self.enableNextButton()
        case 113:
            selectedOption = answer3.text!
            self.enableNextButton()
        case 114:
            selectedOption = answer4.text!
            self.enableNextButton()
        default:
            print("Switch for getting Selected Option")
        }
    }
    private func enableNextButton(){
        nextButton.isEnabled = true
        nextButton.alpha = 1
    }
    @IBAction func nextAction(_ sender: Any) {
        if selectedOption == ""{
            nextButton.alpha = 0.6
        }else{
            theAppModel.sharedInstance.gameObject!.setAnswer1(answerObj: selectedOption)
            goToQuestionVc()
        }
    }
    func goToQuestionVc(){
        let questionVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "question2vc") as? Question2VC
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
