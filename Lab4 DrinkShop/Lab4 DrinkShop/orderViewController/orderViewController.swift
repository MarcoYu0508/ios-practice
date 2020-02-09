//
//  orderViewController.swift
//  Lab4 DrinkShop
//
//  Created by Marco on 2020/2/9.
//  Copyright © 2020 NTNU. All rights reserved.
//

import UIKit

@objc protocol OrderViewDelegate {
    func sendOrder(myOrder: drink)
}

class orderViewController: UIViewController {

    var myDrink : drink!
    weak var delegate : OrderViewDelegate?
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sweetSelect: UISegmentedControl!
    @IBOutlet weak var iceSelect: UISegmentedControl!
    @IBOutlet weak var priceTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))
        priceTextField.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))
        if myDrink != nil {
            nameTextField.text = myDrink.name
            sweetSelect.selectedSegmentIndex = myDrink.sweetSelectIndex
            iceSelect.selectedSegmentIndex = myDrink.iceSelectIndex
            priceTextField.text = "\(myDrink.price)"
        }
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        view.endEditing(true)
//        super.touchesBegan(touches, with: event)
//    }

    @IBAction func sendBtnClick(_ sender: Any) {
        if myDrink == nil {
            myDrink = drink()
        }
        myDrink.name = nameTextField.text ?? ""
        myDrink.sweetSelectIndex = sweetSelect.selectedSegmentIndex
        myDrink.sweetness = sweetSelect.titleForSegment(at: sweetSelect.selectedSegmentIndex)!
        myDrink.iceSelectIndex = iceSelect.selectedSegmentIndex
        myDrink.ice = iceSelect.titleForSegment(at: iceSelect.selectedSegmentIndex)!
        myDrink.price = Int(priceTextField.text!) ?? 0
        delegate?.sendOrder(myOrder: myDrink)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func tapDone(sender: Any){
        self.view.endEditing(true)
    }
}
