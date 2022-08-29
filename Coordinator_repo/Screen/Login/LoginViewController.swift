//
//  LoginViewController.swift
//  Coordinator_repo
//
//  Created by phlong on 26/08/2022.
//

import UIKit

class LoginViewController: BaseViewController {
    var onSignInSuccess: (() -> Void)?
    var onSignUpAction: (() -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func actionSignIn(_ sender: Any) {
        onSignInSuccess?()
    }
    
    @IBAction func actionSignUp(_ sender: Any) {
        onSignUpAction?()
    }
    

}
