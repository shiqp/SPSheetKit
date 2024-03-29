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
        let sheet = SPSheetController(sourceView: sender, sourceRect: sender.bounds, presentationOrigin: sender.frame.minY, presentationDirection: .up)

        let menuItem1 = SPSheetMenuItem(title: "Title1", image: UIImage(named: "note"), target: self, action: #selector(onMenuItemTapped))
        let menuItem2 = SPSheetMenuItem(title: "Title2", image: UIImage(named: "note"), target: self, action: #selector(onMenuItemTapped))
        let menuItem3 = SPSheetMenuItem(title: "Title3", image: UIImage(named: "note"), target: self, action: #selector(onMenuItemTapped))
        sheet.menuItems.append(menuItem1)
        sheet.menuItems.append(menuItem2)
        sheet.menuItems.append(menuItem3)

        self.present(sheet, animated: true)
    }

    @IBAction func showSheetDown(_ sender: UIButton) {
        let sheet = SPSheetController(sourceView: sender, sourceRect: sender.bounds, presentationOrigin: sender.frame.maxY, presentationDirection: .down)

        let menuItem1 = SPSheetMenuItem(title: "Title1", image: UIImage(named: "note"), target: self, action: #selector(onMenuItemTapped))
        let menuItem2 = SPSheetMenuItem(title: "Title2", image: UIImage(named: "note"), target: self, action: #selector(onMenuItemTapped))
        let menuItem3 = SPSheetMenuItem(title: "Title3", image: UIImage(named: "note"), target: self, action: #selector(onMenuItemTapped))
        sheet.menuItems.append(menuItem1)
        sheet.menuItems.append(menuItem2)
        sheet.menuItems.append(menuItem3)

        self.present(sheet, animated: true)
    }

    @objc func onMenuItemTapped() {
        print("Item tapped!")
    }

}

