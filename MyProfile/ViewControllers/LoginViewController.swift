//
//  ViewController.swift
//  MyProfile
//
//  Created by Алексей Зарудный on 12.03.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    let zarudny = User.getUser()
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let username = "qwe"
    private let password = "111"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
                welcomeVC.user = username
    }
//        guard let tabBarVC = segue.destination as? UITabBarController else { return }
//
//        for viewController in tabBarVC {
//            if let welcomVC = viewController as? WelcomeViewController {
//                welcomVC.user = username
//            } else if let navigationVC = viewController as? UINavigationController {
//                let aboutUserVC = viewController as? AboutMeViewController
//                aboutUserVC.aboutMeLabel.text = "QQQQQQQQ"
//
//            } else if let fotoVC = viewController as? FotoViewController {
//                fotoVC.fotoLabel.text = "👻"
//            }
//        }
//    }
    
    
    @IBAction func loginButtonPress() {
        guard usernameTextField.text == username, passwordTextField.text == password else {
            showAlert(
                title: "ERROR",
                message: "Enter correct username or password",
                textField: passwordTextField
            )
            return
        }
        performSegue(withIdentifier: "openWelcomeVC", sender: nil)
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func showFogotData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "👻", message: username)
        : showAlert(title: "🤐", message: password)
    }
}

extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {
            _ in textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            loginButtonPress()
        }
        return true
    }
}

