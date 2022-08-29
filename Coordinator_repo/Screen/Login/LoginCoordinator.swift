//
//  LoginCoordinator.swift
//  Coordinator_repo
//
//  Created by phlong on 26/08/2022.
//

import Foundation

protocol LoginCoordinatorProtocol: AnyObject {
    func didEndLoginFlow(coordinator: LoginCoordinator)
}

class LoginCoordinator: BaseCoordinator {
    weak var delegate: LoginCoordinatorProtocol?
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
            guard let self = self else { return }
            self.delegate?.didEndLoginFlow(coordinator: self)
        }

        router.setRootModule(loginVC)
    }
    
    private func showSignup() {
        let signupCoordinator = SignupCoordinator(router: router)
        signupCoordinator.start()
    }
    
}
