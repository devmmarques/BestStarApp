//
//  RepositoryService.swift
//  BestStarApp
//
//  Created by Marco Marques on 04/09/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Foundation

protocol RepositoryServiceProtocol  {
    typealias RepositoryResult = Result<RepositoriesResponse, WebserviceError>
    func searchRepository(completion: @escaping (RepositoryResult) -> Void)
}

final class RepositoryService: NSObject, RepositoryServiceProtocol {
    
    let service: Webservice
    
    init(service: Webservice = BaseWebservice()) {
        self.service = service
    }
    
    func searchRepository(completion: @escaping (RepositoryResult) -> Void) {
        service.request(urlString: API.Path.searchRepositories.value,
                        parameters: API.Parameters.searchBestStars(language: "swift").value,
                        encoding: .queryString) { (result: RepositoryResult) in
                            
            switch result {
            case let .success(response):
                completion(.success(response))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
