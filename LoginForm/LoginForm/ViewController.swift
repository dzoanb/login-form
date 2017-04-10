//
//  ViewController.swift
//  LoginForm
//
//  Created by Joanna Bednarz on 10/04/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var loginAttempts: Int {
        return UserDefaults.standard.integer(forKey: "NUMBER_OF_ATTEMPTS")
    }

    @IBAction func logInButtonTouched(_ sender: UIButton) {
        guard loginAttempts < 3 else {
            presentAlert(withTitle: "Ups!", message: "To many failures.")
            return
        }
        presentAlert(withTitle: "Ups!", message: "Something went wrong..")
        saveLoginFailure()
    }

    func saveLoginFailure() {
        UserDefaults.standard.set(loginAttempts + 1, forKey: "NUMBER_OF_ATTEMPTS")
    }

    func presentAlert(withTitle title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { s_ in }))
        present(alertController, animated: false, completion: nil)
    }
}

