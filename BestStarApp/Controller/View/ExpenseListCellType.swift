//
//  ExpenseListCellType.swift
//  BestStarApp
//
//  Created by Marco Marques on 05/09/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Foundation

enum ExpenseListCellType<T> {
    case loading
    case cell(T)
    case error(WebserviceError)
}
