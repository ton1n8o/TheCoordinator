//
//  NewOrderCoordinator.swift
//  TheCoordinator
//
//  Created by Antonio Carlos on 2/14/18.
//  Copyright © 2018 Antonio Carlos. All rights reserved.
//

import UIKit

protocol NewOrderCoordinatorDelegate: class {
    func newOrderCoordinatorDidRequestCancel(newOrderCoordinator: NewOrderCoordinator)
}

class NewOrderCoordinatorPayload {
    var colorSelected: UIColor?
}

class NewOrderCoordinator: RootViewCoordinator {
    
    let services: Services
    var childCoordinators: [Coordinator] = []
    
    var rootViewController: UIViewController {
        return navigationController
    }
    
    weak var delegate: NewOrderCoordinatorDelegate?
    var orderPayload: NewOrderCoordinatorPayload?
    
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
        vcColors.delegate = self
        navigationController.pushViewController(vcColors, animated: true)
    }
    
}

extension NewOrderCoordinator: ColorsTableViewControllerDelegate {
    
    func colorViewControllerDidTapClose(_ colorViewController: ColorsTableViewController) {
        delegate?.newOrderCoordinatorDidRequestCancel(newOrderCoordinator: self)
    }
    
    func colorViewController(_ colorViewController: ColorsTableViewController, didSelectColor color: UIColor) {
        
    }
}
