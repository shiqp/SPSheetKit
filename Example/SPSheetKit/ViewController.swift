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

        let menuItem1 = SPSheetMenuItem(title: "Title1", image: UIImage(named: "note"), action: #selector(onMenuItemTapped))
        let menuItem2 = SPSheetMenuItem(title: "Title2", image: UIImage(named: "note"), action: #selector(onMenuItemTapped))
        sheet.menuItems.append(menuItem1)
        sheet.menuItems.append(menuItem2)

        self.present(sheet, animated: true)
    }

    @objc func onMenuItemTapped() {

    }

}

