//
//  ViewController.swift
//  Lab7 List
//
//  Created by 游孟修 on 2020/2/22.
//  Copyright © 2020 游孟修. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableViewContainer: UIView!
    @IBOutlet weak var collectionViewContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewContainer.isHidden = true
        
        let fruitNameArr = ["apple", "avocado", "banana", "cherries", "coconut", "grapes", "lemon", "orange", "peach", "pineapple", "strawberry", "tomato" ]
        let userDefaults = UserDefaults.standard
        userDefaults.set(fruitNameArr, forKey: "fruitName")
        title = "Table View"
    }

    @IBAction func switchBtnClick(_ btn: UIBarButtonItem) {
        if btn.tag == 0 {
            btn.tag = 1
            title = "Collection View"
        }
        else{
            btn.tag = 0
            title = "Table View"
        }
        tableViewContainer.isHidden = !tableViewContainer.isHidden
        collectionViewContainer.isHidden = !collectionViewContainer.isHidden
    }
    
}

