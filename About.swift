//
//  About.swift
//  Compassion
//
//  Created by Geecon System Ltd. on 11/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//Edited by local

import UIKit

class About: UIView {
    @IBOutlet weak var view_1: UIView!
    @IBOutlet weak var lbl_cir: UILabel!
    @IBOutlet weak var childImg: UIImageView!
    @IBOutlet weak var childName: UILabel!


    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        childImg.layer.cornerRadius = childImg.layer.frame.size.width / 2
        childImg.layer.masksToBounds = true
        childImg.layer.borderWidth = 3;
        childImg.layer.borderColor = UIColor(
            red: 224.0/255.0,
            green: 175.0/255.0,
            blue: 41.0/255.0,
            alpha: CGFloat(1.0)
            ).cgColor
        
        view_1.layer.cornerRadius = view_1.layer.frame.size.width / 2
        view_1.layer.masksToBounds = true
        lbl_cir.layer.cornerRadius = lbl_cir.layer.frame.size.width / 2
        lbl_cir.layer.masksToBounds = true
    }

    
}
