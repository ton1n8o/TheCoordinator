//
//  NameViewController.swift
//  TheCoordinator
//
//  Created by Antonio Carlos on 2/14/18.
//  Copyright © 2018 Antonio Carlos. All rights reserved.
//

import UIKit

protocol NameViewControllerDelegate: class {
    func colorViewController(_ nameViewController: NameViewController, didSet name: String)
}

class NameViewController: UIViewController, StoryboardLoadable {
    
    // MARK:  Outlets
    @IBOutlet var tvFirstName: UITextField!
    @IBOutlet var tvSecondName: UITextField!
    
    public weak var delegate: NameViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK:  Actions
    
    @IBAction func actionDone(sender: AnyObject) {
        
        // basic validation for the full name
        guard let firstName = tvFirstName.text else {
            return
        }
        guard let lastName = tvSecondName.text else {
            return
        }
        guard !firstName.isEmpty && !lastName.isEmpty else {
            return
        }
        delegate?.colorViewController(self, didSet: "\(firstName) \(lastName)")
        
    }

}
