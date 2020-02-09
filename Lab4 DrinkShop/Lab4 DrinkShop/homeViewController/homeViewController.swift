//
//  homeViewController.swift
//  Lab4 DrinkShop
//
//  Created by Marco on 2020/2/9.
//  Copyright © 2020 NTNU. All rights reserved.
//

import UIKit

class drink: NSObject {
    var name : String = ""
    var sweetness : String = ""
    var sweetSelectIndex : Int = 0
    var ice : String = ""
    var iceSelectIndex : Int = 0
    var price : Int = 0
}

extension homeViewController : OrderViewDelegate{
    func sendOrder(myOrder: drink){
        myDrink = myOrder	
    }
}

class homeViewController: UIViewController {

    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var showOrderLabel: UILabel!
    @IBOutlet weak var completeBtn: UIBarButtonItem!
    var myDrink : drink!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showOrderLabel.text = "您尚未點餐\n請點選開始點餐進行點餐作業"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if myDrink != nil {
            startBtn.setTitle("修改訂單", for: .normal)
            showOrderLabel.text = String(format: "您的飲料：%@\n甜度為：%@\n冰量為：%@\n售價為：%d", myDrink.name, myDrink.sweetness, myDrink.ice, myDrink.price)
            completeBtn.isEnabled = true
        }
        else {
            startBtn.setTitle("開始訂單", for: .normal)
            completeBtn.isEnabled = false
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "orderSegue" {
            let VC = segue.destination as! orderViewController
            VC.myDrink = myDrink
            VC.delegate = self
        }
    }

    @IBAction func completeBtnClick(_ sender: Any) {
        let VC = completeViewController()
        VC.myDrink = myDrink
        VC.closure = {(msg:String)->() in
            self.myDrink = nil
            self.showOrderLabel.text = msg
            self.startBtn.setTitle("開始點餐", for: .normal)
            self.completeBtn.isEnabled = false
        }
        present(VC, animated: true, completion: nil)
    }
}
