//
//  ViewController.swift
//  Lab11 Cocoapods
//
//  Created by 游孟修 on 2020/3/15.
//  Copyright © 2020 游孟修. All rights reserved.
//

import UIKit
import Toast

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showToastBtnClick(_ sender: Any) {
        let showStr = textField.text
        if showStr != "" {
            view.makeToast(showStr)
        } else {
            view.makeToast("請輸入文字")
        }
    }
    
}

