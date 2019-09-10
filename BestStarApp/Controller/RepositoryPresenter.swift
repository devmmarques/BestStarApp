//
//  RepositoryPresenter.swift
//  BestStarApp
//
//  Created by Marco Marques on 05/09/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Foundation

enum TypeUpdateView {
    case first
    case pagination
    case pullRefresh
}

final class RepositoryPresenter {
    
    weak var viewProtocol: RepositoryProtocol?
    private var service: RepositoryServiceProtocol
    private var total = 0
    private var currentPage = 1
    private var isFetchInProgress = false
    
    private var allRepository: [RepositoryListCellType<Repository>] = []
    
    var totalCount: Int {
        return total
    }
    
    var currentCount: Int {
        return allRepository.count
    }
    
    init(service: RepositoryServiceProtocol = RepositoryService()) {
        self.service = service
    }
    
    func searchRepository(type: TypeUpdateView) {
        guard !isFetchInProgress else {
            return
        }
        
        if type == .first {
          allRepository = [.loading]
        }
        
        if type == .pullRefresh {
            currentPage = 1
        }
        
        isFetchInProgress = true
        
        service.searchRepository(page: currentPage) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(repository):
                self.total = repository.total_count
                
                self.loadRepository(type: type, repositoryResponse: repository)
                
                self.viewProtocol?.showView()
                self.isFetchInProgress = false
              
                self.currentPage += 1
            case let .failure(error):
                self.isFetchInProgress = false
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
    
    private func loadRepository(type: TypeUpdateView, repositoryResponse: RepositoriesResponse) {
        switch type {
        case .first, .pullRefresh:
            self.allRepository = repositoryResponse.items.map {
                return RepositoryListCellType.cell($0)
            }
        case .pagination:
            let newsRepositories = repositoryResponse.items.map {
                return RepositoryListCellType.cell($0)
            }
            self.allRepository.append(contentsOf: newsRepositories)
        }
    }
}
