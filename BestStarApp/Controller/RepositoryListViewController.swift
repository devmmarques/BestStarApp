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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
}

extension RepositoryListViewController: CodeViewProtocol {
    func buildViewHierarchy() {
        self.view.addSubview(backGroundView)
    }
    
    func setupConstraints() {
        
        backGroundView.anchor(top: view.topAnchor,
                              leading: view.leadingAnchor,
                              bottom: view.bottomAnchor,
                              trailing: view.trailingAnchor,
                              insets: .init(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    
}
