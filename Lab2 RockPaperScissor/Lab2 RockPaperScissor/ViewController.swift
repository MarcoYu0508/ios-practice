//
//  ViewController.swift
//  Lab2 RockPaperScissor
//
//  Created by Marco on 2020/2/8.
//  Copyright © 2020 NTNU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameFiled: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var userSelectSegment: UISegmentedControl!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var mySelectLabel: UILabel!
    @IBOutlet weak var pcSelectLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startBtnClick(_ sender: Any) {
        if nameFiled.text != "" {
            nameLabel.text = String(format: "名字\n%@", nameFiled.text!)
            let myIndex = userSelectSegment.selectedSegmentIndex
            let mySelect = getSelectBy(index: myIndex)
            mySelectLabel.text = String(format: "我方出拳\n%@", mySelect)
            let pcIndex = Int.random(in: 0...2)
            let pcSelect = getSelectBy(index: pcIndex)
            pcSelectLabel.text = String(format: "電腦出拳\n%@", pcSelect)
            showWinnerBy(myIndex: myIndex, pcIndex: pcIndex)
        }
    }
    
    func getSelectBy(index:Int) -> String {
        // 出拳 index = 0:剪刀 1:石頭 2:布
        return userSelectSegment.titleForSegment(at: index)!
    }
    
    func showWinnerBy(myIndex:Int, pcIndex:Int) {
        // 判斷勝負
        if myIndex == pcIndex {
            textLabel.text = "平手，再試一次"
            winnerLabel.text = "勝利者\n平手"
        }
        else if (myIndex == 0 && pcIndex == 2) ||
                (myIndex == 1 && pcIndex == 0) ||
                (myIndex == 2 && pcIndex == 1){
            textLabel.text = "恭喜你獲得勝利"
            winnerLabel.text = String(format: "勝利者\n%@", nameFiled.text!)
        }
        else {
            textLabel.text = "可惜了，電腦獲勝"
            winnerLabel.text = "勝利者\n電腦"
        }
    }
    
}

