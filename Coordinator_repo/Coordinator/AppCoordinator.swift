//
//  AppCoordinator.swift
//  Coordinator_repo
//
//  Created by phlong on 17/08/2022.
//

import UIKit
fileprivate var isAuth = false

fileprivate enum LaunchInstructor {
    case login, main
    
    static func configure(
        isAuth: Bool = isAuth) -> LaunchInstructor {
            switch (isAuth) {
            case false: return .login
            case true: return .main
            }
        }
}

class AppCoordinator: BaseCoordinator {
    private let router: RouterProtocol
    
    private var instructor: LaunchInstructor {
        return LaunchInstructor.configure()
    }
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    override func start() {
        switch instructor {
        case .login:
            runLoginFlow()
        case .main:
            runMainFlow()
        }
    }
    
    private func runLoginFlow() {
        let loginCoordinator = LoginCoordinator(router: router)
        loginCoordinator.onEndLoginFlow = { [weak self] in
            isAuth = true
            self?.start()
            self?.removeDependency(loginCoordinator)
        }
        addDependency(loginCoordinator)
        loginCoordinator.start()
    }
    
    private func runMainFlow() {
        
        let mainCoordinartor = MainTabbarCoordinator(router: router)
        addDependency(mainCoordinartor)
        mainCoordinartor.start()
    }
}

