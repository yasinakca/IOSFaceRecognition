//
//  ViewController.swift
//  FaceRecognition
//
//  Created by YASIN AKCA on 31.03.2020.
//  Copyright © 2020 YASIN AKCA. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInClicked(_ sender: Any) {
        
        let authContext = LAContext()
        
        var error: NSError?
        
        if authContext.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            authContext.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you?") { (success, error) in
                if success == true {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                }else {
                    DispatchQueue.main.async {
                        self.label.text = "Error!"
                    }
                }
            }
        }
    }
    
}

