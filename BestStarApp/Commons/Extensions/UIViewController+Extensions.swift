//
//  UIViewController+Extensions.swift
//  BestStarApp
//
//  Created by Marco Marques on 05/09/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//


import UIKit

public enum NavigationBarStyle {
    case `default`
    case colored(barColor: UIColor)
}

extension UIViewController {
    
    public func setupNavigationBar(with style: NavigationBarStyle,
                                   prefersLargeTitles: Bool = true) {
        
        guard let navigationController = navigationController else {
            return
        }
        
        switch style {
        case .default:
            navigationController.navigationBar.barTintColor = ColorName.backgroundApp.color
        case .colored(let barColor):
            navigationController.navigationBar.barTintColor = barColor
        }
        
        navigationController.navigationItem.hidesSearchBarWhenScrolling = false
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.barStyle = .black
        navigationController.navigationBar.tintColor = .white
        
        navigationController.navigationBar.prefersLargeTitles = prefersLargeTitles
        
        guard let fontTitleText = UIFont(font: FontFamily.Gotham.black, size: 16) else { return }
        guard let fontLargeTitle = UIFont(font: FontFamily.Gotham.black, size: 28) else { return }
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: fontTitleText, NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: fontLargeTitle, NSAttributedString.Key.foregroundColor: UIColor.white]
        
        
        
        navigationController.navigationBar.layoutIfNeeded()
        navigationItem.backBarButtonItem?.title = ""
    }
}
