//
//  AppDelegate.swift
//  Coordinator_repo
//
//  Created by phlong on 17/08/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    private lazy var applicationCoordinator: Coordinator = self.makeCoordinator()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        applicationCoordinator.start()
        return true
    }
    
    private func makeCoordinator() -> Coordinator {
        let navigation = UINavigationController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        let windowWithNavigation = window?.rootViewController as! UINavigationController
        return AppCoordinator(router: Router(rootController: windowWithNavigation))
    }
}

