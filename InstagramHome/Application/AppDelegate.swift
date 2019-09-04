//
//  AppDelegate.swift
//  InstagramHome
//
//  Created by Daulet on 04/09/2019.
//  Copyright © 2019 daukabase. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        setup(window)
        
        return true
    }

    
    private func setup(_ window: UIWindow?) {
        window?.backgroundColor = .white
        window?.layer.cornerRadius = 10
        window?.layer.masksToBounds = true
        window?.makeKeyAndVisible()
        window?.rootViewController = HomeViewController()
    }

}

