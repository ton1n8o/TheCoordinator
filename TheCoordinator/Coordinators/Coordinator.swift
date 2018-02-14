//
//  Coordinator.swift
//  TheCoordinator
//
//  Created by Antonio Carlos on 2/13/18.
//  Copyright © 2018 Antonio Carlos. All rights reserved.
//

import Foundation

public protocol Coordinator: class {
    
    /// The services that the coordinator can use
    var services: Services { get }
    
    /// The array containing any child Coordinators
    var childCoordinators: [Coordinator] { get set }
    
}

public extension Coordinator {
    
    /// Add a child coordinator to the parent
    public func addChildCoordinator(_ childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }
}
