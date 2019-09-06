//
//  ManagerError.swift
//  BestStarApp
//
//  Created by Marco Marques on 05/09/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import UIKit

struct ManagerError {
    
    func handler(error: WebserviceError, on view: UIView,
                 completion: @escaping () -> Void) {
        let viewError = ErrorView(frame: view.frame, error: error, buttonAction: completion)
        view.addSubview(viewError)
        
        viewError.anchor(top: view.topAnchor,
                         leading: view.leadingAnchor,
                         bottom: view.bottomAnchor,
                         trailing: view.trailingAnchor, insets: .init(top: 0, left: 0, bottom: 0, right: 0))
    }
}
