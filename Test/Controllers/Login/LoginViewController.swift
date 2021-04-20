//
//  ViewController.swift
//  Test
//
//  Created by Owez Orazberdiyew on 4/20/21.
//

import UIKit

class LoginViewController: UIViewControllerWithLoading {

    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        submitButton.layer.cornerRadius = 10
        submitButton.clipsToBounds = true
    }
    
    @IBAction func onLogin(_ sender: Any) {
        // check if entries have valid data
        if (!isValidLogin() || !isValidPassword()){
            return
        }
        
        login()
    }
    
    // proceed login request
    func login(){
        showLoading{
            LoginRestController.login(
                login: self.loginField.text!,
                password: self.passwordField.text!,
                onError: self.onError,
                onSuccess: self.onSuccess
            )
        }
    }
    
    private func onError(message: String) {
        hideLoading {
            self.alertError(errorMessage: message, retry: self.login, cancel: nil)
        }
    }
    
    private func onSuccess(){
        hideLoading {
            self.performSegue(withIdentifier: "PaymentsSegue", sender: nil)
        }
    }
    
    
    // checking if login is valid (just checking if it is empty)
    private func isValidLogin() -> Bool{
        if (loginField.text!.count > 0){
            return true
        }
        alertError(message: "Please enter valid login data")
        return false
    }
    
    // checking if password is valid (just checking if it is empty)
    private func isValidPassword() -> Bool{
        if (passwordField.text!.count > 0){
            return true
        }
        alertError(message: "Please enter valid password")
        return false
    }
    
    // alert error to show error message to user
    private func alertError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

