//
//  StoryboardLoadable.swift
//  TheCoordinator
//
//  Created by Antonio Carlos on 2/14/18.
//  Copyright © 2018 Antonio Carlos. All rights reserved.
//

import UIKit

protocol StoryboardLoadable {
    
    static var storyboardName: String { get }
    static var storyboardIdentifier: String { get }
    
}

extension StoryboardLoadable {
    
    static var storyboardName: String {
        return String(describing: self)
    }
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    static func instantiate(fromStoryboardNamed name: String? = nil) -> Self {
        let sb = name ?? self.storyboardName
        let storyboard = UIStoryboard(name: sb, bundle: nil)
        return instantiate(fromStoryboard: storyboard)
    }
    
    static func instantiate(fromStoryboard storyboard: UIStoryboard) -> Self {
        
        let identifier = self.storyboardIdentifier
        
        guard let vc = storyboard.instantiateViewController(withIdentifier: identifier) as? Self else {
            fatalError("Failed to instantiate view controller with identifier=\(identifier) from storyboard \( storyboard )")
        }
        
        return vc
        
    }
    
}
