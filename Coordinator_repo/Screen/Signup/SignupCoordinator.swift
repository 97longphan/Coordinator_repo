//
//  SignupCoordinator.swift
//  Coordinator_repo
//
//  Created by phlong on 26/08/2022.
//

import Foundation
class SignupCoordinator: BaseCoordinator {
    private let router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    override func start() {
        showSignup()
    }
    
    private func showSignup() {
        let signupVC = SignupViewController()
        router.push(signupVC)
    }
}
