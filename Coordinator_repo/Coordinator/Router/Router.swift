//
//  Router.swift
//  Coordinator_repo
//
//  Created by phlong on 26/08/2022.
//

import UIKit

final class Router: NSObject, RouterProtocol {
    private weak var rootController: UINavigationController?
    private let uiApplication: UIApplication
    
    init(rootController: UINavigationController,
         uiApplication: UIApplication = .shared ) {
        self.rootController = rootController
        self.uiApplication = uiApplication
    }
    
    func setRootModule(_ vc: UIViewController) {
        guard let appDelegate = uiApplication.delegate as? AppDelegate else { return }
        appDelegate.window?.rootViewController = vc
    }
    
    func push(_ vc: UIViewController) {
        rootController?.pushViewController(vc, animated: true)
    }
    
    func present(_ vc: UIViewController) {
        rootController?.present(vc, animated: true)
    }
    
}
