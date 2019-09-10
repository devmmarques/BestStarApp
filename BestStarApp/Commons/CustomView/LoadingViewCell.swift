//
//  LoadingViewCell.swift
//  BestStarApp
//
//  Created by Marco Marques on 05/09/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//


import UIKit
import Lottie

final class LoadingViewCell: UITableViewCell {
    
    private lazy var backGroundView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        view.accessibilityIdentifier = "backGroundView"
        return view
    }()
    
    private lazy var loadingView: AnimationView = {
        let animationView = AnimationView(name: "loading")
        let screen = UIScreen.main
        animationView.frame = screen.bounds
        animationView.accessibilityIdentifier = "loadingView"
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        return animationView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        self.backgroundColor = .clear
        accessibilityIdentifier = "LoadingViewCell"
        setupViews()
        loadingView.play()
    }
}

extension LoadingViewCell: CodeViewProtocol {
    
    func buildViewHierarchy() {
        addSubview(backGroundView)
        backGroundView.addSubview(loadingView)
    }
    
    func setupConstraints() {
        
        let screen = UIScreen.main.bounds
        
        backGroundView.anchor(top: topAnchor,
                              leading: leadingAnchor,
                              trailing: trailingAnchor,
                              insets: .init(top: 0, left: 0, bottom: 0, right: 0))
        backGroundView.anchor(height: screen.height)
        
        loadingView.anchorCenterSuperview()
    }
}
