//
//  RepositoryWebserviceSpec.swift
//  BestStarAppTests
//
//  Created by Marco Marques on 04/09/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Nimble
import Quick

@testable import BestStarApp

final class RepositoryWebserviceSpec: QuickSpec {


    override func spec() {
        
        describe("Test repository webservice") {
            
            context("requestRepositories function") {
                
                var webservice: RepositoryService!
                
                it("return valid client git repositories if service has ok.") {
                    webservice = RepositoryService(service: MockWebservice(type: .searchRepositories))
                    webservice.searchRepository(completion: { result in
                        switch result {
                        case .success:
                            expect(true) == true
                        case .failure:
                            XCTFail()
                        }
                    })
                }
                
                it("return unexpected error after webservice returns unexpected error") {
                    webservice = RepositoryService(service: MockWebservice(type: .unexpectedError))
                    webservice.searchRepository(completion: { result in
                        switch result {
                        case .success:
                            XCTFail()
                        case let .failure(error):
                            expect(error) == .unexpected
                        }
                    })
                }
            }
        }
    }
}
