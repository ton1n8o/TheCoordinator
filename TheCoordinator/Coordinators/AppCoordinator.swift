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
        return navigationController
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
        
        self.window.rootViewController = rootViewController
        self.window.makeKeyAndVisible()
    }

    // MARK: - Functions
    
    /// Starts the coordinator
    public func start() {
        showSplashViewController()
    }
    
    private func showSplashViewController() {
        let splashViewController = SplashViewController.instantiate(fromStoryboardNamed: "Main")
        splashViewController.services = services
        splashViewController.delegate = self
        navigationController.viewControllers = [splashViewController]
    }
}

// MARK: - SplashViewControllerDelegate

extension AppCoordinator: SplashViewControllerDelegate {
    
    func splashViewDidTapNewOrder(splashViewController: SplashViewController) {
        let newOrderCoordinator = NewOrderCoordinator(services)
        newOrderCoordinator.delegate = self
        newOrderCoordinator.start()
        addChildCoordinator(newOrderCoordinator)
        rootViewController.present(newOrderCoordinator.rootViewController, animated: true, completion: nil)
    }
    
}

extension AppCoordinator: NewOrderCoordinatorDelegate {
    
    func newOrderCoordinatorDidRequestCancel(newOrderCoordinator: NewOrderCoordinator) {
        newOrderCoordinator.rootViewController.dismiss(animated: true)
        removeChildCoordinator(newOrderCoordinator)
    }
    
    func newOrderCoordinator(newOrderCoordinator: NewOrderCoordinator, didAddOrder: NewOrderCoordinatorPayload) {
        
        guard let color = didAddOrder.colorSelected
            , let name = didAddOrder.nameSelected else {
            return
        }
        
        let order = Order(color: color.toHexString, constumerName: name)
        
        services.dataService.orders.append(order)
        newOrderCoordinator.rootViewController.dismiss(animated: true)
        removeChildCoordinator(newOrderCoordinator)
    }
    
}

extension UIColor {
    
    var toHexString: String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        return String(
            format: "%02X%02X%02X",
            Int(r * 0xff),
            Int(g * 0xff),
            Int(b * 0xff)
        )
    }
}
