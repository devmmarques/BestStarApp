//
//  CodeViewProtocol.swift
//  BestStarApp
//
//  Created by Marco Marques on 05/09/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

protocol CodeViewProtocol {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupViews()
}

extension CodeViewProtocol {
    func setupViews() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    func setupAdditionalConfiguration() { }
}

