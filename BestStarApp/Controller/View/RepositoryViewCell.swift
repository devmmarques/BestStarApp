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
        image.layer.borderColor = ColorName.blueApp.color.cgColor
        return image
    }()
    
    private lazy var nameAuthor: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "nameAuthor"
        label.font = UIFont(font: FontFamily.Gotham.black, size: 14)
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    private lazy var nameRepository: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "nameRepository"
        label.font = UIFont(font: FontFamily.Gotham.bookItalic, size: 12)
        label.textAlignment = .left
        label.textColor = .gray
        return label
    }()
    
    private lazy var iconStar: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFit
        image.accessibilityIdentifier = "iconStar"
        image.image = Asset.star.image
        return image
    }()
    
    private lazy var numberStartRepository: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "numberStartRepository"
        label.font = UIFont(font: FontFamily.Gotham.thinItalic, size: 12)
        label.textAlignment = .left
        label.textColor = .white
        label.text = "Marco Marques"
        return label
    }()
    
    private lazy var lineSeparator: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .gray
        view.alpha = 0.7
        view.accessibilityIdentifier = "lineSeparator"
        return view
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
        accessibilityIdentifier = "repositoryViewCell"
        setupViews()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        configureLayoutContact()
    }
    
    private func configureLayoutContact() {
        imageProfile.layer.cornerRadius = imageProfile.frame.size.width / 2
        imageProfile.layer.masksToBounds = true
        imageProfile.layer.borderWidth = 2.0
        
    }
    
    func configure(repository: Repository) {
        nameRepository.text = repository.full_name
        nameAuthor.text = repository.owner.login.uppercased()
        imageProfile.imageFromURL(urlString: repository.owner.avatar_url)
        numberStartRepository.text = String(repository.stargazers_count)
    }
}


extension RepositoryViewCell: CodeViewProtocol {
    
    func buildViewHierarchy() {
        addSubview(viewCell)
        viewCell.addSubview(imageProfile)
        viewCell.addSubview(nameAuthor)
        viewCell.addSubview(nameRepository)
        viewCell.addSubview(iconStar)
        viewCell.addSubview(numberStartRepository)
        viewCell.addSubview(lineSeparator)
    }
    
    func setupConstraints() {
        viewCell.anchor(top: topAnchor,
                           leading: leadingAnchor,
                           bottom: bottomAnchor,
                           trailing: trailingAnchor,
                           insets: .init(top: 0, left: 0, bottom: 0, right: 0))
        viewCell.anchor(height: 80)
        
        imageProfile.anchor(leading: viewCell.leadingAnchor,
                            insets: .init(top: 0, left: 20.0, bottom: 0, right: 0))
        imageProfile.anchor(height: 55.0, width: 55.0)
        imageProfile.anchorCenterYToSuperview()
        
        nameAuthor.anchor(top: viewCell.topAnchor,
                              leading: imageProfile.trailingAnchor,
                              trailing: viewCell.trailingAnchor,
                              insets: .init(top: 10.0, left: 16.0, bottom: 0, right: 10.0))
        
        nameRepository.anchor(top: nameAuthor.bottomAnchor,
                                leading: imageProfile.trailingAnchor,
                                trailing: viewCell.trailingAnchor,
                                insets: .init(top: 6.0, left: 16.0, bottom: 0, right: 15.0))
        
        
        iconStar.anchor(top: nameRepository.bottomAnchor,
                        leading: imageProfile.trailingAnchor,
                        insets: .init(top: 6.0, left: 16.0, bottom: 0, right: 0))
        iconStar.anchor(height: 16.0, width: 16.0)
        
        numberStartRepository.anchor(top: nameRepository.bottomAnchor,
                                     leading: iconStar.trailingAnchor,
                                     trailing: viewCell.trailingAnchor,
                                     insets: .init(top: 8.0, left: 10.0, bottom: 0, right: 20.0))
        
        lineSeparator.anchor(height: 0.6)
        lineSeparator.anchor(top: numberStartRepository.bottomAnchor,
                             leading: viewCell.leadingAnchor,
                             trailing: viewCell.trailingAnchor,
                             insets: .init(top: 10.0, left: 90.0, bottom: 0, right: 20.0))
        
       
    }
    
}
