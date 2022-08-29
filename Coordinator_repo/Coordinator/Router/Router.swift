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
    
    func setRootModule(_ presentable: Presentable) {
        guard let appDelegate = uiApplication.delegate as? AppDelegate else { return }
        appDelegate.window?.rootViewController = presentable.toPresent()
    }
    
    func push(_ presentable: Presentable) {
        guard let controller = presentable.toPresent() else { return }
        rootController?.pushViewController(controller, animated: true)
    }
    
    func present(_ presentable: Presentable) {
        guard let controller = presentable.toPresent() else { return }
        rootController?.present(controller, animated: true)
    }
    
    func toRoot() {
        rootController?.popToRootViewController(animated: true)
    }
    
}
