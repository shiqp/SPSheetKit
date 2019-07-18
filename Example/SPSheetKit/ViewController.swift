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
    }

    @IBAction func showSheet(_ sender: UIButton) {
        let sheet = SPSheetController(sourceView: sender, sourceRect: sender.bounds, presentationOrigin: 650, presentationDirection: .up)

        let menuItem1 = SPSheetMenuItem(title: "Title1", image: UIImage(named: "note"), action: #selector(onMenuItemTapped))
        let menuItem2 = SPSheetMenuItem(image: UIImage(named: "note"), action: #selector(onMenuItemTapped))
        let menuItem3 = SPSheetMenuItem(title: "Title3", action: #selector(onMenuItemTapped))
        let menuItem4 = SPSheetMenuItem(title: "Title4", action: #selector(onMenuItemTapped))
        sheet.menuItems.append(menuItem1)
        sheet.menuItems.append(menuItem2)
        sheet.menuItems.append(menuItem3)
        sheet.menuItems.append(menuItem4)

        self.present(sheet, animated: true)
    }

    @objc func onMenuItemTapped() {

    }

}

