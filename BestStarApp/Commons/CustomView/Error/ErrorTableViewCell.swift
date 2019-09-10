//
//  ErrorTableViewCell.swift
//  BestStarApp
//
//  Created by Marco Marques on 05/09/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//


import UIKit

final class ErrorTableViewCell: UITableViewCell {
    
    func setupCell(error: WebserviceError, completion: @escaping () -> Void) {
        self.backgroundColor = .clear
        ManagerError().handler(error: error, on: self, completion: completion)
    }
}
