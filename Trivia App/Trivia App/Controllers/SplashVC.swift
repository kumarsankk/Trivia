//
//  SplashVC.swift
//  Trivia App
//
//  Created by Basith on 19/04/20.
//  Copyright © 2020 Sanjay. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        goToMainVc()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func goToMainVc(){
        let mainVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainvc") as? MainVC
        self.navigationController?.pushViewController(mainVc!, animated: true)
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
