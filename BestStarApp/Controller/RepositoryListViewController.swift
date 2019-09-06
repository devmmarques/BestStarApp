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
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        return tableView
    }()
    
    let repository = [Repository(id: 0, name: "Marco Henrique", full_name: "SWIFT UI", owner: Owner(login: "mmarques", id: 0, avatar_url: ""), stargazers_count: 100),
                      Repository(id: 0, name: "Marco Henrique", full_name: "SWIFT UI", owner: Owner(login: "mmarques", id: 0, avatar_url: ""), stargazers_count: 100),
                      Repository(id: 0, name: "Marco Henrique", full_name: "SWIFT UI", owner: Owner(login: "mmarques", id: 0, avatar_url: ""), stargazers_count: 100),
                      Repository(id: 0, name: "Marco Henrique", full_name: "SWIFT UI", owner: Owner(login: "mmarques", id: 0, avatar_url: ""), stargazers_count: 100),
                      Repository(id: 0, name: "Marco Henrique", full_name: "SWIFT UI", owner: Owner(login: "mmarques", id: 0, avatar_url: ""), stargazers_count: 100),
                      Repository(id: 0, name: "Marco Henrique", full_name: "SWIFT UI", owner: Owner(login: "mmarques", id: 0, avatar_url: ""), stargazers_count: 100),
                      Repository(id: 0, name: "Marco Henrique", full_name: "SWIFT UI", owner: Owner(login: "mmarques", id: 0, avatar_url: ""), stargazers_count: 100),
                      Repository(id: 0, name: "Marco Henrique", full_name: "SWIFT UI", owner: Owner(login: "mmarques", id: 0, avatar_url: ""), stargazers_count: 100),
                      Repository(id: 0, name: "Marco Henrique", full_name: "SWIFT UI", owner: Owner(login: "mmarques", id: 0, avatar_url: ""), stargazers_count: 100),
                      Repository(id: 0, name: "Marco Henrique", full_name: "SWIFT UI", owner: Owner(login: "mmarques", id: 0, avatar_url: ""), stargazers_count: 100),
                      Repository(id: 0, name: "Marco Henrique", full_name: "SWIFT UI", owner: Owner(login: "mmarques", id: 0, avatar_url: ""), stargazers_count: 100),
                      Repository(id: 0, name: "Marco Henrique", full_name: "SWIFT UI", owner: Owner(login: "mmarques", id: 0, avatar_url: ""), stargazers_count: 100),
                      Repository(id: 0, name: "Marco Henrique", full_name: "SWIFT UI", owner: Owner(login: "mmarques", id: 0, avatar_url: ""), stargazers_count: 100),
                      Repository(id: 0, name: "Marco Henrique", full_name: "SWIFT UI", owner: Owner(login: "mmarques", id: 0, avatar_url: ""), stargazers_count: 100),
                      Repository(id: 0, name: "Marco Henrique", full_name: "SWIFT UI", owner: Owner(login: "mmarques", id: 0, avatar_url: ""), stargazers_count: 100)]
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTableView()
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
        self.tableView.contentInsetAdjustmentBehavior = .automatic
        self.tableView.register(RepositoryViewCell.self)
    }
}

extension RepositoryListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repository.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as RepositoryViewCell
        cell.configure(repository: repository[indexPath.row])
        return cell
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
