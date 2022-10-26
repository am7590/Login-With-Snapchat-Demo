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
  
        let loginButton = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        loginButton.backgroundColor = .red
        loginButton.setTitle("Connect to snapchat", for: .normal)
        loginButton.addTarget(self, action: #selector(performLogin), for: .touchUpInside)
            
        let userDataButton = UIButton(frame: CGRect(x: 200, y: 200, width: 150, height: 50))
        userDataButton.backgroundColor = .green
        userDataButton.setTitle("Get user info", for: .normal)
        userDataButton.addTarget(self, action: #selector(displayProfile), for: .touchUpInside)
        
        self.view.addSubview(loginButton)
        self.view.addSubview(userDataButton)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        userDataButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            userDataButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            userDataButton.topAnchor.constraint(equalToSystemSpacingBelow: loginButton.bottomAnchor, multiplier: 2)
        ])
    }
    
    @objc func performLogin() {
        //SCSDKLoginClient.login() never completes once scene becomes active again after Snapchat redirect back to this app.
        SCSDKLoginClient.login(from: self, completion: { success, error in
            if let error = error {
                print("***ERROR LOC: manualTrigger() \(error.localizedDescription)***")
                return
            }
            if success {
                print("login success")
            }
        })
    }
    
    @objc func displayProfile() {
        let builder = SCSDKUserDataQueryBuilder().withDisplayName().withBitmojiTwoDAvatarUrl()
        SCSDKLoginClient.fetchUserData(
            with: builder.build(),
            success:  { (userData, errors) in
                let displayName = userData?.displayName ?? ""
                let avatar = userData?.bitmojiTwoDAvatarUrl ?? ""
                
                // Needs to be on the main thread to control the UI.
                DispatchQueue.main.async {
                    print(avatar)

                }
            },
            failure: { (error: Error?, isUserLoggedOut: Bool) in
                if let error = error {
                    print(String.init(format: "Failed to fetch user data. Details: %@", error.localizedDescription))
                }
            })
    }
    
    @objc func buttonAction(sender: UIButton!) {
        displayProfile()
    }
}


