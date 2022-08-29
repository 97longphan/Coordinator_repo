//
//  AppCoordinator.swift
//  Coordinator_repo
//
//  Created by phlong on 17/08/2022.
//

import UIKit

fileprivate enum LaunchInstructor {
    case login, main
    
    static func configure(
        isAuth: Bool) -> LaunchInstructor {
            switch (isAuth) {
            case false: return .login
            case true: return .main
            }
        }
}

class AppCoordinator: BaseCoordinator {
    private let router: RouterProtocol
    private var isAuth: Bool {
        return UserDefaults.standard.bool(forKey: "isAuth")
    }
    
    private var instructor: LaunchInstructor {
        return LaunchInstructor.configure(isAuth: isAuth)
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
        loginCoordinator.delegate = self
        addDependency(loginCoordinator)
        loginCoordinator.start()
    }
    
    private func runMainFlow() {
        let mainCoordinartor = MainTabbarCoordinator(router: router)
        addDependency(mainCoordinartor)
        mainCoordinartor.start()
    }
}

extension AppCoordinator: LoginCoordinatorProtocol {
    func didEndLoginFlow(coordinator: LoginCoordinator) {
        UserDefaults.standard.set(true, forKey: "isAuth")
        start()
        removeDependency(coordinator)
    }
}
