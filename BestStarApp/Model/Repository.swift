//
//  Repository.swift
//  BestStarApp
//
//  Created by Marco Marques on 04/09/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Foundation

struct Repository: Codable {
    let id: Int
    let name: String
    let full_name: String
    let owner: Owner
    let stargazers_count: Int
}
