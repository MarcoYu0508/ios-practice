//
//  scrollingViewController.swift
//  Lab5 TabBar&Container
//
//  Created by Marco on 2020/2/16.
//  Copyright © 2020 NTNU. All rights reserved.
//

import UIKit

class scrollingViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let page = scrollView.contentOffset.x/scrollView.frame.size.width
        pageControl.currentPage = Int(page)
        print(Int(page))

        // Do any additional setup after loading the view.
    }
}

extension scrollingViewController:UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x/scrollView.frame.size.width
        pageControl.currentPage = Int(page)
        print(Int(page))
    }
}
