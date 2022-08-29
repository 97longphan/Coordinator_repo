//
//  LoginCoordinator.swift
//  Coordinator_repo
//
//  Created by phlong on 26/08/2022.
//

import Foundation

class LoginCoordinator: BaseCoordinator {
    var onEndLoginFlow: (() -> Void)?
    private let router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    override func start() {
        showLogin()
    }
    
    private func showLogin() {
        let loginVC = LoginViewController()
        loginVC.onSignUpAction = { [weak self] in
            self?.showSignup()
        }
        
        loginVC.onSignInSuccess = { [weak self] in
            self?.onEndLoginFlow?()
        }
        
        router.setRootModule(loginVC)
    }
    
    private func showSignup() {
        let signupCoordinator = SignupCoordinator(router: router)
        signupCoordinator.start()
    }
    
}
