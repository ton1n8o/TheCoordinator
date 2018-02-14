//
//  AppCoordinator.swift
//  TheCoordinator
//
//  Created by Antonio Carlos on 2/13/18.
//  Copyright © 2018 Antonio Carlos. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: RootViewCoordinator {
    
    let window: UIWindow
    let services: Services
    var childCoordinators = [Coordinator]()
    
    var rootViewController: UIViewController {
        return self.navigationController
    }
    
    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = true
        return navigationController
    }()
    
    // MARK: - Init
    
    public init(window: UIWindow, services: Services) {
        self.services = services
        self.window = window
        
        self.window.rootViewController = self.rootViewController
        self.window.makeKeyAndVisible()
    }

    // MARK: - Functions
    
    /// Starts the coordinator
    public func start() {
        self.showSplashViewController()
    }
    
    private func showSplashViewController() {
        let splashViewController = SplashViewController.instantiate(fromStoryboardNamed: "Main")
        splashViewController.services = self.services
        splashViewController.delegate = self
        self.navigationController.viewControllers = [splashViewController]
    }
}

// MARK: - SplashViewControllerDelegate

extension AppCoordinator: SplashViewControllerDelegate {
    func splashViewDidTapNewOrder(splashViewController: SplashViewController) {
        let newOrderCoordinator = NewOrderCoordinator(services)
        newOrderCoordinator.delegate = self
        newOrderCoordinator.start()
        self.addChildCoordinator(newOrderCoordinator)
        self.rootViewController.present(newOrderCoordinator.rootViewController, animated: true, completion: nil)
    }
}

extension AppCoordinator: NewOrderCoordinatorDelegate {
    
}
