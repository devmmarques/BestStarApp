//
//  RepositoryViewCell.swift
//  BestStarApp
//
//  Created by Marco Marques on 05/09/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import UIKit

final class RepositoryViewCell: UITableViewCell {
    
    // MARK: Outlets
    private lazy var viewCell: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        view.accessibilityIdentifier = "viewCell"
        return view
    }()
    
    
    private lazy var imageProfile: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFit
        image.accessibilityIdentifier = "imageProfile"
        image.layer.borderColor = ColorName.greenApp.color.cgColor
        return image
    }()
    
    private lazy var nameRepository: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "nameRepository"
        label.font = UIFont(font: FontFamily.Gotham.light, size: 14)
        label.textAlignment = .right
        label.textColor = ColorName.greenBasicApp.color
        label.text = "@mmarques"
        return label
    }()
    
    private lazy var nameAuthor: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "nameAuthor"
        label.font = UIFont(font: FontFamily.Gotham.bold, size: 16)
        label.textAlignment = .right
        label.textColor = ColorName.greenBasicApp.color
        label.text = "@mmarques"
        return label
    }()
    
    private lazy var numberStartRepository: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "numberStartRepository"
        label.font = UIFont(font: FontFamily.Gotham.bookItalic, size: 12)
        label.textAlignment = .right
        label.textColor = ColorName.greenLight.color
        label.text = "Marco Marques"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupCell() {
        self.selectionStyle = .none
        self.backgroundColor = .clear
        setupViews()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        configureLayoutContact()
    }
    
    private func configureLayoutContact() {
        imageProfile.layer.cornerRadius = imageProfile.frame.size.width / 2
        imageProfile.layer.masksToBounds = true
        imageProfile.layer.borderWidth = 1.0
    }
    
    func configure(repository: Repository) {
        nameRepository.text = repository.full_name
        nameAuthor.text = repository.owner.login
    }
}


extension RepositoryViewCell: CodeViewProtocol {
    
    func buildViewHierarchy() {
        addSubview(viewCell)
        viewCell.addSubview(imageProfile)
        viewCell.addSubview(nameRepository)
        viewCell.addSubview(nameAuthor)
    }
    
    func setupConstraints() {
        viewCell.anchor(top: topAnchor,
                           leading: leadingAnchor,
                           bottom: bottomAnchor,
                           trailing: trailingAnchor,
                           insets: .init(top: 0, left: 0, bottom: 0, right: 0))
        viewCell.anchor(height: 80)
        
        imageProfile.anchor(leading: viewCell.leadingAnchor,
                            insets: .init(top: 0, left: 20.0, bottom: 1.0, right: 0))
        imageProfile.anchor(height: 52.0, width: 52.0)
        imageProfile.anchorCenterYToSuperview()
        
        nameRepository.anchor(top: viewCell.topAnchor,
                                leading: imageProfile.trailingAnchor,
                                insets: .init(top: 20.0, left: 16.0, bottom: 0, right: 0))
        
        nameAuthor.anchor(top: nameRepository.bottomAnchor,
                                leading: imageProfile.trailingAnchor,
                                insets: .init(top: 1.0, left: 16.0, bottom: 0, right: 0))
    }
    
}
