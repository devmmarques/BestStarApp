//
//  RepositoryCoordinator.swift
//  BestStarApp
//
//  Created by Marco Marques on 05/09/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import UIKit

final class RepositoryCoordinator: Coordinator {
    private let router: AnyNavigationRouter<UINavigationController>
    var finishflow: (() -> Void)?
    
    required init<Router: NavigationRouterProtocol>(router: Router) where Router.Controller == UINavigationController {
        self.router = AnyNavigationRouter(router)
        super.init()
    }
    
    override func start() {
        let controller = RepositoryListViewController()
        router.push(controller, animated: true)
    }
}

private extension RepositoryCoordinator {
   
}

extension RepositoryCoordinator: Presentable {
    func toPresent() -> ControllerProtocol {
        return router.rootController
    }
}
