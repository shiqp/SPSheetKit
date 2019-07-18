//
//  SPSheetMenuItem.swift
//  SPSheetKit
//
//  Created by Qingpu Shi on 2019/7/12.
//

import UIKit

@objcMembers
public class SPSheetMenuItem: NSObject {
    public let title: String?
    public let image: UIImage?
    public let action: Selector

    let target: AnyObject

    public init(title: String? = nil, image: UIImage? = nil, target: Any, action: Selector) {
        self.image = image?.withRenderingMode(.alwaysTemplate)
        self.title = title
        self.action = action
        self.target = target as AnyObject
        super.init()
    }
}
