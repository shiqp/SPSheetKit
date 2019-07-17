//
//  SPSheetCell.swift
//  SPSheetKit
//
//  Created by Qingpu Shi on 2019/7/12.
//

import UIKit

class SPSheetCell: UICollectionViewCell {
    private struct Constants {
        static let imageSize: CGFloat = 24
        static let imageMargin: CGFloat = 10
        static let fontSize: CGFloat = 15
        static let labelMargin: CGFloat = 10
        static let separatorHeight: CGFloat = 0.5
    }

    static var identifier = "SPSheetCell"

    var titleLabel = UILabel()
    var imageView = UIImageView()
    var separator = UIView()

    func setupSubviews() {
        self.backgroundColor = .clear

        self.titleLabel.removeFromSuperview()
        self.imageView.removeFromSuperview()
        self.separator.removeFromSuperview()

        self.titleLabel.textColor = SPSheetColors.content
        self.titleLabel.font = UIFont.systemFont(ofSize: Constants.fontSize)
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.titleLabel)
        self.titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

        self.separator.backgroundColor = SPSheetColors.separator
        self.separator.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.separator)
        self.separator.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.separator.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.separator.heightAnchor.constraint(equalToConstant: Constants.separatorHeight).isActive = true

        if imageView.image == nil {
            self.titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Constants.labelMargin).isActive = true
            self.separator.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Constants.labelMargin).isActive = true
        } else {
            self.imageView.tintColor = SPSheetColors.content
            self.imageView.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(self.imageView)
            self.imageView.heightAnchor.constraint(equalToConstant: Constants.imageSize).isActive = true
            self.imageView.widthAnchor.constraint(equalToConstant: Constants.imageSize).isActive = true
            self.imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            self.imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Constants.imageMargin).isActive = true

            self.titleLabel.leftAnchor.constraint(equalTo: self.imageView.rightAnchor, constant: Constants.labelMargin).isActive = true
            self.separator.leftAnchor.constraint(equalTo: self.imageView.rightAnchor, constant: Constants.labelMargin).isActive = true
        }
    }
}
