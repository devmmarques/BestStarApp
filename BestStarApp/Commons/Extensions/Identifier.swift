//
//  Identifier.swift
//  BestStarApp
//
//  Created by Marco Marques on 05/09/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//


import UIKit

extension UIViewController {
    var identifier: String {
        return String(describing: self)
    }
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewHeaderFooterView {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
