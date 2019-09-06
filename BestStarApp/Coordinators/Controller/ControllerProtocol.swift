//
//  ControllerProtocol.swift
//  BestStarApp
//
//  Created by Marco Marques on 05/09/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

enum ControllerPresentStyle {
    case present(animated: Bool)
    case push(animated: Bool)
    case setRoot(animated: Bool)
}

protocol ControllerProtocol: AnyObject {
    func present<Controller: ControllerProtocol>(_ controller: Controller, style: ControllerPresentStyle)
    func dismiss(animated: Bool)
}
