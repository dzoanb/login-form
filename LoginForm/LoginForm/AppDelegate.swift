//
//  AppDelegate.swift
//  LoginForm
//
//  Created by Joanna Bednarz on 10/04/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let enviroment = ProcessInfo.processInfo.environment

        if let attemptsEnvironment = enviroment["NUMBER_OF_ATTEMPTS"], let numberOfAttempts = Int(attemptsEnvironment) {
            UserDefaults.standard.set(numberOfAttempts, forKey: "NUMBER_OF_ATTEMPTS")
        }

        return true
    }
}
