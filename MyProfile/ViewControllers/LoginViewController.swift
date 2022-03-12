//
//  ViewController.swift
//  MyProfile
//
//  Created by Алексей Зарудный on 12.03.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var userTF: UITextField!
    @IBOutlet var passTF: UITextField!
    
    let user = "qwe"
    let pass = "111"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.user = user
    }
    @IBAction func login() {
        guard userTF.text == user, passTF.text == pass else {
            showAlert(title: "ERROR", message: "Enter correct username or password", textField: passTF)
            return
        }
        performSegue(withIdentifier: "openWelcomeVC", sender: nil)
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userTF.text = ""
        passTF.text = ""
    }
    
    @IBAction func forgot(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "👻", message: user)
        : showAlert(title: "🤐", message: pass)
    }
    
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {
            _ in textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userTF {
            passTF.becomeFirstResponder()
        } else {
            login()
        }
        return true
    }
}

