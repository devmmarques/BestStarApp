//
//  MockRepositoryWebservice.swift
//  BestStarAppUITests
//
//  Created by Marco Henrique Maia Marques on 10/09/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

@testable import BestStarApp

enum RepositoryWebserviceType {
    case success
    case notConnectedToInternet
    case failure
}

struct MockRepositoryWebservice: RepositoryServiceProtocol {
    
    let type: RepositoryWebserviceType
    
    init(type: RepositoryWebserviceType) {
        self.type = type
    }
    
    
    func searchRepository(page: Int, completion: @escaping (RepositoryResult) -> Void) {
        switch self.type {
        case .success:
            let data = MockWebservice(type: .searchRepositories).data
            let jsonDecoder = JSONDecoder()
            let object = try! jsonDecoder.decode(RepositoriesResponse.self, from: data)
            DispatchQueue(label: "MockWebservice").asyncAfter(deadline: .now() + 1) {
                DispatchQueue.main.async {
                    completion(.success(object))
                }
            }
        case .notConnectedToInternet:
            completion(.failure(.notConnectedToInternet))
        case .failure:
            completion(.failure(.unexpected))
        }
    }
    
  
}
