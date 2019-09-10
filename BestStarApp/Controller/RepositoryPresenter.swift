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
    
    func searchRepository() {
        guard !isFetchInProgress else {
            return
        }
        
        if self.currentPage == 1 {
          allRepository = [.loading]
        }
        isFetchInProgress = true
        
        service.searchRepository(page: currentPage) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(repository):
                self.total = repository.total_count
                
                if self.currentPage == 1 {
                    self.allRepository = repository.items.map {
                        return RepositoryListCellType.cell($0)
                    }
                } else {
                    let newsRepositories = repository.items.map {
                        return RepositoryListCellType.cell($0)
                    }
                    self.allRepository.append(contentsOf: newsRepositories)
                }
                
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
}
