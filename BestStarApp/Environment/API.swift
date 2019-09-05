//
//  API.swift
//  BestStarApp
//
//  Created by Marco Marques on 04/09/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Foundation

struct API {
    enum Path {
        case search
        
        var value: String {
            let baseURL = Environment.current.baseURLString
            
            switch self {
            case .search:
                return "\(baseURL)/search/repositories"
            }
        }
    }
}
