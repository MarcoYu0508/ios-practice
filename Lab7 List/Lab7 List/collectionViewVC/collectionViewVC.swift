//
//  collectionViewVC.swift
//  Lab7 List
//
//  Created by 游孟修 on 2020/2/22.
//  Copyright © 2020 游孟修. All rights reserved.
//

import UIKit

class collectionViewVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var fruitNameArr : [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewInit()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let userDefault = UserDefaults.standard
        fruitNameArr = userDefault.value(forKey: "fruitName") as? [String]
    }
    
    func collectionViewInit() {
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerView")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reuseCell")
        let cellNib = UINib(nibName: "myCollectionViewCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "myCollectionViewCell")
    }
}

extension collectionViewVC:UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return fruitNameArr?.count ?? 0
        }
        else{
            return 20
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionViewCell", for: indexPath) as! myCollectionViewCell
            let fruit = fruitNameArr?[indexPath.row] ?? ""
            cell.setCell(imgName: fruit, title: fruit)
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseCell", for: indexPath)
            cell.backgroundColor = UIColor(red: 10*CGFloat(indexPath.row)/255, green: 20*CGFloat(indexPath.row)/255, blue: 30*CGFloat(indexPath.row)/255, alpha: 1)
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: cell.bounds.size.height))
            label.text = String(format: "%d", indexPath.row)
            label.textColor = UIColor.red
            for subView in cell.contentView.subviews{
                subView.removeFromSuperview()
            }
            cell.contentView.addSubview(label)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerView", for: indexPath)
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: headerView.bounds.size.width, height: headerView.bounds.size.height))
            label.textAlignment = .center
            if indexPath.section == 0 {
                label.text = "客製化 Collection View Cell"
            }
            else{
                label.text = "原生 Collection View Cell"
            }
            for subView in headerView.subviews{
                  subView.removeFromSuperview()
            }
            headerView.addSubview(label)
            return headerView
        }
        return UICollectionReusableView()
    }
    
}

extension collectionViewVC:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            let width = Int((collectionView.bounds.size.width-20)/3)
            let height = Int(CGFloat(width)*1.5)
            return CGSize(width: width, height: height)
        }
        else{
            let width = Int((collectionView.bounds.size.width-40)/5)
            return CGSize(width: width, height: width)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = collectionView.bounds.size.width
        return CGSize(width: width, height: 50)
    }
}
