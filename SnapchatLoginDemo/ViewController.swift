//
//  ViewController.swift
//  SnapchatLoginDemo
//
//  Created by Alek Michelson on 10/23/22.
//

import UIKit
import SCSDKLoginKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = SCSDKLoginButton { success, error in
            guard success, error == nil else { return }
        }

        loginButton.sizeToFit()
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)
            
    }
}
