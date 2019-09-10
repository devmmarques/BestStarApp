//
//  Presentable+UIKit.swift
//  BestStarApp
//
//  Created by Marco Marques on 05/09/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import class UIKit.UIViewController
import class UIKit.UIWindow

extension UIViewController: Presentable {
    func toPresent() -> ControllerProtocol {
        return self
    }
}

extension UIWindow: Presentable {
    func toPresent() -> ControllerProtocol {
        return rootViewController!
    }
}
