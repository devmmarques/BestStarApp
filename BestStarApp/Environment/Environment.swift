//
//  Environment.swift
//  BestStarApp
//
//  Created by Marco Marques on 04/09/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Foundation

struct Environment {
    let configuration: Configuration
    
    init(configuration: Configuration) {
        self.configuration = configuration
    }
    
    static var current: Environment {
        return Environment(configuration: .current())
    }
}

extension Environment {
    var baseURLString: String {
        switch configuration {
        case .development:
            return "https://api.github.com"
        default:
            return "https://api.github.com"
        }
    }
}
