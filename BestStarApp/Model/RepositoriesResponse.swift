//
//  RepositoriesResponse.swift
//  BestStarApp
//
//  Created by Marco Marques on 04/09/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Foundation

struct RepositoriesResponse: Codable {
    let total_count: Int
    let items: [Repository]
}
