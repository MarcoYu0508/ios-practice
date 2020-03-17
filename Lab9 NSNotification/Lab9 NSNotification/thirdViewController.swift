//
//  thirdViewController.swift
//  Lab9 NSNotification
//
//  Created by 游孟修 on 2020/2/28.
//  Copyright © 2020 游孟修. All rights reserved.
//

import UIKit

class thirdViewController: UIViewController {

    @IBOutlet weak var sender: UILabel!
    @IBOutlet weak var msg: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    var publicNotification : NSObjectProtocol?
    var regionNotification : NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("thirdView")
        initNotification()
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
    
    func showTime(_ timeData:Dictionary<String,Int>){
        let hour = timeData["hour"]
        let min = timeData["min"]
        let sec = timeData["sec"]
        timeLabel.text = String(format:"%02d:%02d:%02d",hour ?? 0,min ?? 0,sec ?? 0)
    }
    
    func showMsg(_ msgData:Dictionary<String,String>){
        sender.text = msgData["sender"]
        msg.text = msgData["msg"]
    }

}
