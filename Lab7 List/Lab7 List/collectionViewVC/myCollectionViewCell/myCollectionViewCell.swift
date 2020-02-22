//
//  myCollectionViewCell.swift
//  Lab7 List
//
//  Created by 游孟修 on 2020/2/22.
//  Copyright © 2020 游孟修. All rights reserved.
//

import UIKit

class myCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(imgName:String, title:String) {
        imgView.image = UIImage(named: imgName)
        titleLabel.text = title
    }

}
