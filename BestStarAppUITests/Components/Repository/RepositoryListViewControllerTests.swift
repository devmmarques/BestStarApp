//
//  RepositoryViewControllerTests.swift
//  BestStarAppUITests
//
//  Created by Marco Henrique Maia Marques on 10/09/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//
import XCTest
import Foundation
@testable import BestStarApp

final class RepositoryListViewControllerTests: KIFTestCase {
    
    private func createController(type: RepositoryWebserviceType) {
        let service = MockRepositoryWebservice(type: type)
        let presenter = RepositoryPresenter(service: service)
        let controller = RepositoryListViewController(presenter: presenter)
        
        let window = UIApplication.shared.keyWindow!
        
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }
    
    func testSuccessWhenNoError() {
        createController(type: .success)
        tester.waitForView(withAccessibilityIdentifier: "loadingView")
        tester.waitForView(withAccessibilityIdentifier: "tableViewRepositories")
        tester.waitForView(withAccessibilityIdentifier: "repositoryViewCell")
    }
    
    func testNotInternetError() {
        createController(type: .notConnectedToInternet)
        tester.waitForView(withAccessibilityIdentifier: "viewError")
        tester.waitForView(withAccessibilityIdentifier: "labelDescriptionError")
        tester.waitForView(withAccessibilityIdentifier: "buttonErrorTryAgain")
        //tester.waitForView(withAccessibilityIdentifier: L10n.errorInternetTitle)
    }
    
}
