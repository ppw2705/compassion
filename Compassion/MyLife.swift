//
//  MyLife.swift
//  Compassion
//
//  Created by Grevin on 03/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class MyLife: UIView {
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var countryV: UIView!
    @IBOutlet weak var scrolle_me: UIScrollView!
    @IBOutlet weak var childImg: UIImageView!
    @IBOutlet weak var childName: UILabel!

    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        childImg.layer.cornerRadius = childImg.layer.frame.size.width / 2
        childImg.layer.masksToBounds = true
        childImg.layer.borderWidth = 3;
        childImg.layer.borderColor = UIColor(
            red: 16.0/255.0,
            green: 87.0/255.0,
            blue: 169.0/255.0,
            alpha: CGFloat(1.0)
            ).cgColor
        ageLbl.layer.cornerRadius = ageLbl.layer.frame.size.width / 2
        ageLbl.layer.masksToBounds = true
        countryV.layer.cornerRadius = countryV.layer.frame.size.width / 2
        countryV.layer.masksToBounds = true
        //self.layer.cornerRadius = 10.0
        //self.clipsToBounds = true
    }
}
