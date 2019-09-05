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
        case searchRepositories
        
        var value: String {
            let baseURL = Environment.current.baseURLString
            
            switch self {
            case .searchRepositories:
                return "\(baseURL)/search/repositories"
            }
        }
    }
    
    enum Parameters {
        case searchBestStars(language: String)
        
        var value: [String: Any] {
            switch self {
            case .searchBestStars(let language):
                return ["q":"language:\(language)","sort": "stars"]
            }
        }
    }
}
