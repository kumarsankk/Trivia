//
//  MainVC.swift
//  Trivia App
//
//  Created by Basith on 19/04/20.
//  Copyright © 2020 Sanjay. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func nextAction(_ sender: Any) {
        // if name entered is empty show place holder else go to Questions
        if nameTextField.text == ""{
            nameTextField.placeholder = "Enter Your Name"
        }else{
            let currentDateTime = Date()//.timeIntervalSince1970
            theAppModel.sharedInstance.gameObject!.setDate(dateObj: currentDateTime)
            theAppModel.sharedInstance.gameObject!.setName(nameObj: nameTextField.text!)
            goToQuestionVc()
        }
    }
    func goToQuestionVc(){
        let questionVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "question1vc") as? Question1Vc
        self.navigationController?.pushViewController(questionVc!, animated: true)
    }
    // Hide KeyBoard When Pressed Return Key ...
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
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
