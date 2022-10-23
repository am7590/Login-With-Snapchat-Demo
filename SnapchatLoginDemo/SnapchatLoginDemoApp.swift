//
//  SnapchatLoginDemoApp.swift
//  SnapchatLoginDemo
//
//  Created by Alek Michelson on 10/23/22.
//

import SwiftUI
import UIKit
import SCSDKLoginKit

@main
struct SnapchatLoginDemoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("didFinishLaunchingWithOptions")
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        return SCSDKLoginClient.application(app, open: url, options: options)
    }
}
