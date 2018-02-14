//
//  NewOrderCoordinator.swift
//  TheCoordinator
//
//  Created by Antonio Carlos on 2/14/18.
//  Copyright © 2018 Antonio Carlos. All rights reserved.
//

import UIKit

protocol NewOrderCoordinatorDelegate: class {
    
}

class NewOrderCoordinator: RootViewCoordinator {
    
    let services: Services
    var childCoordinators: [Coordinator] = []
    
    var rootViewController: UIViewController {
        return self.navigationController
    }
    
    weak var delegate: NewOrderCoordinatorDelegate?
    
    init(_ services: Services) {
        self.services = services
    }
    
    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        return navigationController
    }()
    
    // MARK:  Functions
    
    func start() {
        let vcColors = ColorsTableViewController.instantiate(fromStoryboardNamed: "Main")
        vcColors.services = services
        self.navigationController.pushViewController(vcColors, animated: true)
    }
    
}
