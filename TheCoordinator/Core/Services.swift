//
//  Services.swift
//  TheCoordinator
//
//  Created by Antonio Carlos on 2/13/18.
//  Copyright © 2018 Antonio Carlos. All rights reserved.
//

import Foundation

/// You can think of this class as our service provider, by using it one may
/// have access the an APIClient or persistence layer.
public struct Services {
    
    public let dataService: DataService
    
    init() {
        self.dataService = DataService()
    }
    
}

public struct Order {
    let color: String
    let constumerName: String
}

public class DataService {
    var orders: [Order] = []
}
