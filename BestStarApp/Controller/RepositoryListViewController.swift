//
//  RepositoryListViewController.swift
//  BestStarApp
//
//  Created by Marco Marques on 05/09/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import UIKit

final class RepositoryListViewController: UIViewController {
    
    // MARK: UI
    private lazy var backGroundView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = ColorName.backgroundApp.color
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private let presenter: RepositoryPresenter
    
    init(presenter: RepositoryPresenter = RepositoryPresenter()) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.viewProtocol = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTableView()
        presenter.searchRepository()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    
    private func setupNavigation() {
        setupNavigationBar(with: .default, prefersLargeTitles: true)
        self.title = L10n.bestStarApp
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.prefetchDataSource = self
        self.tableView.contentInsetAdjustmentBehavior = .automatic
        self.tableView.register(RepositoryViewCell.self)
        self.tableView.register(LoadingViewCell.self)
        self.tableView.register(ErrorTableViewCell.self)
    }
}

extension RepositoryListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.currentCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let repositoryItem = presenter.getRepository(by: indexPath.row)
        
        switch repositoryItem {
        case let .cell(repository):
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as RepositoryViewCell
            cell.configure(repository: repository)
            return cell
        case .loading:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as LoadingViewCell
            return cell
        case let .error(error):
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ErrorTableViewCell
            cell.setupCell(error: error) { [weak self] in
                guard let self = self else { return }
                self.presenter.searchRepository()
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension RepositoryListViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            presenter.searchRepository()
        }
    }
}


extension RepositoryListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}


extension RepositoryListViewController: CodeViewProtocol {
    func buildViewHierarchy() {
        self.view.addSubview(backGroundView)
        backGroundView.addSubview(tableView)
    }
    
    func setupConstraints() {
        
        backGroundView.anchor(top: view.topAnchor,
                              leading: view.leadingAnchor,
                              bottom: view.bottomAnchor,
                              trailing: view.trailingAnchor,
                              insets: .init(top: 0, left: 0, bottom: 0, right: 0))
        
        tableView.anchor(top: backGroundView.topAnchor,
                         leading: backGroundView.leadingAnchor,
                         bottom: backGroundView.bottomAnchor,
                         trailing: backGroundView.trailingAnchor,
                         insets: .init(top: 0, left: 0, bottom: 0, right: 0))
    }
}


extension RepositoryListViewController: RepositoryProtocol {
    
    func showView() {
        self.tableView.reloadData()
    }
}

extension RepositoryListViewController {
    
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row >= presenter.currentCount-1
    }
}
