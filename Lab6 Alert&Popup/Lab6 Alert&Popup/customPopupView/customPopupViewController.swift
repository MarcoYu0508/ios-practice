//
//  customPopupViewController.swift
//  Lab6 Alert&Popup
//
//  Created by 游孟修 on 2020/2/20.
//  Copyright © 2020 游孟修. All rights reserved.
//

import UIKit

class customPopupViewController: UIViewController {

    @IBOutlet weak var popupView: UIView!
    var selectHandler : ((String)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func showInVC(VC:UIViewController) {
        self.modalPresentationStyle = .overCurrentContext
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = .fade
        VC.view.window?.layer.add(transition, forKey: kCATransition)
        VC.present(self, animated: false) {
            self.popupView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            self.popupView.alpha = 0
            UIView.animate(withDuration: 0.25){
                self.popupView.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.popupView.alpha = 1
            }
        }
    }
    
    func disMissPopupView() {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = .fade
        view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func dismissView(_ sender: Any){
        disMissPopupView()
    }
    
    @IBAction func selectFood(_ btn: UIButton){
        disMissPopupView()
        self.selectHandler!(btn.titleLabel!.text!)
     }
}
