//
//  myTableViewCell.swift
//  Lab7 List
//
//  Created by 游孟修 on 2020/2/22.
//  Copyright © 2020 游孟修. All rights reserved.
//

import UIKit

class myTableViewCell: UITableViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(imgName:String, title:String) {
        myImageView.image = UIImage(named: imgName)
        titleLabel.text = title
    }
    
}
