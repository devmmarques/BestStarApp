//
//  RepositoryPresenter.swift
//  BestStarApp
//
//  Created by Marco Marques on 05/09/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Foundation


final class RepositoryPresenter {
    
    weak var viewProtocol: RepositoryProtocol?
    private var service: RepositoryServiceProtocol
    
    private var allRepository: [RepositoryListCellType<Repository>] = [] {
        didSet {
            self.viewProtocol?.showView()
        }
    }
    
    init(service: RepositoryServiceProtocol = RepositoryService()) {
        self.service = service
    }
    
    func searchRepository() {
        allRepository = [.loading]
        service.searchRepository { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(repository):
                self.allRepository = repository.items.map {
                    return RepositoryListCellType.cell($0)
                }
            case let .failure(error):
                self.allRepository = [RepositoryListCellType.error(error)]
            }
        }
    }
}

extension RepositoryPresenter {
    
    func getCountRepositories() -> Int {
        return allRepository.count
    }
    
    func getRepository(by index: Int) -> RepositoryListCellType<Repository> {
        return allRepository[index]
    }
}
