//
//  ViewController.swift
//  Lab6 Alert&Popup
//
//  Created by 游孟修 on 2020/2/20.
//  Copyright © 2020 游孟修. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func demoAlertActionSheet(_ sender: Any) {
        let actionSheetController = UIAlertController(title: "標題", message: "說明", preferredStyle: .actionSheet)
        let commonAction = UIAlertAction(title: "預設樣式", style: .default)
        let destructiveAction = UIAlertAction(title: "危險樣式", style: .destructive)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel)
        actionSheetController.addAction(commonAction)
        actionSheetController.addAction(destructiveAction)
        actionSheetController.addAction(cancelAction)
        present(actionSheetController, animated: true)
    }
    
    @IBAction func demoAlertView(_ sender: Any) {
        let alertController = UIAlertController(title: "標題", message: "說明", preferredStyle: .alert)
        let commonAction = UIAlertAction(title: "預設樣式", style: .default)
        let destructiveAction = UIAlertAction(title: "危險樣式", style: .destructive)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel)
        alertController.addAction(commonAction)
        alertController.addAction(destructiveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    @IBAction func login(_ sender: Any) {
        let alertController = UIAlertController(title: "登入", message: "輸入帳號密碼", preferredStyle: .alert)
        alertController.addTextField(configurationHandler: { (textField) in
            textField.placeholder = "請輸入帳號"
        })
        alertController.addTextField(configurationHandler: { (textField) in
            textField.placeholder = "請輸入密碼"
            textField.isSecureTextEntry = true
        })
        let determination = UIAlertAction(title: "確定", style: .default) { (action) in
            let account = alertController.textFields![0]
            let password = alertController.textFields![1]
            self.showLogin(account.text!, password.text!)
        }
        let cancelAction = UIAlertAction(title: "取消", style: .cancel)
        alertController.addAction(determination)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    func showLogin(_ account:String, _ password:String) {
        let msgView = UIAlertController(title: "登入成功", message: String(format: "帳號: %@\n密碼: %@", account, password), preferredStyle: .alert)
        let dertermination = UIAlertAction(title: "確定", style: .default)
        msgView.addAction(dertermination)
        present(msgView, animated: true)
    }
    
    @IBAction func showCustomPopup(_ sender: Any) {
        let VC = customPopupViewController()
        VC.selectHandler = { (name:String)->() in
            self.showStringData(str: name)
        }
        VC.showInVC(VC: self)
    }
    
    func showStringData(str:String) {
        let msgView = UIAlertController(title: str, message: nil, preferredStyle: .alert)
        let dertermination = UIAlertAction(title: "確定", style: .default)
        msgView.addAction(dertermination)
        present(msgView, animated: true)
    }
    
}

