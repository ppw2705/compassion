//
//  ChildCollectionViewCell.swift
//  Compassion
//
//  Created by Grevin on 27/07/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class ChildCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var Img: UIImageView!
    @IBOutlet weak var Name: UILabel!
    
    /*var myChild : childCircle! {
        didSet{
            updateDate();
        }
    }
    
    func updateDate() {
        Name.text = myChild.name;
        Img.image = myChild.images;
    }*/
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        Img.layer.cornerRadius = Img.layer.frame.size.width / 2
        Img.layer.masksToBounds = true
        //self.layer.cornerRadius = 10.0
        //self.clipsToBounds = true
    }
}
