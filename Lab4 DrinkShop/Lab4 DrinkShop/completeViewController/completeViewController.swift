//
//  completeViewController.swift
//  Lab4 DrinkShop
//
//  Created by Marco on 2020/2/9.
//  Copyright © 2020 NTNU. All rights reserved.
//

import UIKit

class completeViewController: UIViewController {
    
    var closure : ((String)->())!
    var myDrink : drink!
    @IBOutlet weak var orderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderLabel.text = String(format: "您的飲料：%@\n甜度為：%@\n冰量為：%@\n售價為：%d", myDrink.name, myDrink.sweetness, myDrink.ice, myDrink.price)
    }
	

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func backHomePage(_ sender: Any) {
        closure("您的餐點已送出\n請點選開始點餐進行下一次點餐作業")
        dismiss(animated: true, completion: nil)
    }
}
