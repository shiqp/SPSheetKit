//
//  ViewController.swift
//  SPSheetKit
//
//  Created by shiqp on 07/11/2019.
//  Copyright (c) 2019 shiqp. All rights reserved.
//

import SPSheetKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .lightGray
    }

    @IBAction func showSheet(_ sender: UIButton) {
        let sheet = SPSheetController(presentationOrigin: -1, presentationDirection: .down)

        let menuItem = SPSheetMenuItem(title: "Title", image: nil, action: #selector(onMenuItemTapped))
        sheet.menuItems.append(menuItem)

        self.present(sheet, animated: true)
    }

    @objc func onMenuItemTapped() {

    }

}

