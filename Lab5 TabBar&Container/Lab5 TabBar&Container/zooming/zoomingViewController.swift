//
//  zoomingViewController.swift
//  Lab5 TabBar&Container
//
//  Created by Marco on 2020/2/16.
//  Copyright © 2020 NTNU. All rights reserved.
//

import UIKit

class zoomingViewController: UIViewController {

    
    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension zoomingViewController:UIScrollViewDelegate{
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return containerView
    }
}
