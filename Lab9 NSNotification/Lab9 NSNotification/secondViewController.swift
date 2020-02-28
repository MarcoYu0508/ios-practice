//
//  secondViewController.swift
//  Lab9 NSNotification
//
//  Created by 游孟修 on 2020/2/28.
//  Copyright © 2020 游孟修. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    @IBOutlet weak var msgTextField: UITextField!
    @IBOutlet weak var sender: UILabel!
    @IBOutlet weak var msg: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var keyBoardBtn: UIButton!
    var publicNotification: NSObjectProtocol?
    var regionNotification: NSObjectProtocol?
    var keyBoardShowNotification: NSObjectProtocol?
     var keyBoardHideNotification: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNotification()
        keyBoardBtn.setTitle("已關閉系統鍵盤通知", for: .normal)
        keyBoardBtn.setTitle("已開啟系統鍵盤通知", for: .selected)
    }
    
    func initNotification() {
        let publicName = NSNotification.Name("public")
        publicNotification = NotificationCenter.default.addObserver(forName: publicName, object: nil, queue: OperationQueue.main){
            (notification) in
            let timeData = notification.object as! Dictionary<String, Int>
            self.showTime(timeData)
        }
        let regionName = NSNotification.Name("region")
        regionNotification = NotificationCenter.default.addObserver(forName: regionName, object: nil, queue: OperationQueue.main){
            (notification) in
            let msgData = notification.object as! Dictionary<String, String>
            self.showMsg(msgData)
        }
    }
    
    func showTime(_ timeData: Dictionary<String, Int>) {
        let hour = timeData["hour"]!
        let min = timeData["min"]!
        let sec = timeData["sec"]!
        timeLabel.text = String(format: "%02d:%02d:%02d", hour, min, sec)
    }
    
    func showMsg(_ msgData: Dictionary<String, String>) {
        sender.text = msgData["sender"]
        msg.text = msgData["msg"]
    }
    
    @IBAction func registerKeyBoardNotification(_ btn: UIButton) {
        if !btn.isSelected {
            keyBoardShowNotification = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: OperationQueue.main){
                (notification) in
                print("觸發顯示鍵盤")
                self.sender.text = "系統"
                self.msg.text = "顯示鍵盤"
            }
            keyBoardHideNotification = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: OperationQueue.main){
                (notification) in
                print("觸發隱藏鍵盤")
                self.sender.text = "系統"
                self.msg.text = "隱藏鍵盤"
            }
            btn.isSelected = true;
        }
        else {
            NotificationCenter.default.removeObserver(keyBoardShowNotification!)
            NotificationCenter.default.removeObserver(keyBoardHideNotification!)
            btn.isSelected = false
        }
    }
    
    @IBAction func regionNotificationSend(_ sender: Any) {
        let sendDic = getSendData()
        let name = NSNotification.Name("region")
        NotificationCenter.default.post(name: name, object: sendDic)
    }
    
    func getSendData() -> Dictionary<String, String> {
        var sendDic = [String:String]()
        sendDic["msg"] = msgTextField.text
        sendDic["sender"] = "畫面二"
        return sendDic
    }
    
    @IBAction func hideKeyBoard(_ sender: Any) {
        view.endEditing(true)
    }
    
}
