//
//  SPSheetCell.swift
//  SPSheetKit
//
//  Created by Qingpu Shi on 2019/7/12.
//

import UIKit

class SPSheetCell: UITableViewCell {
    static var identifier = "SPSheetCell"

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.selectionStyle = .none
        self.setupSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private Functions

extension SPSheetCell {
    private func setupSubviews() {
        self.backgroundColor = .clear
        self.imageView?.tintColor = .white
        self.textLabel?.textColor = .white
    }
}
