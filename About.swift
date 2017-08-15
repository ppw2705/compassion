//
//  About.swift
//  Compassion
//
//  Created by Geecon System Ltd. on 11/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//Edited by ppw2705u@gmail.com

import UIKit

class About: UIView {
    @IBOutlet weak var view_1: UIView!
    @IBOutlet weak var lbl_cir: UILabel!


    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        view_1.layer.cornerRadius = view_1.layer.frame.size.width / 2
        view_1.layer.masksToBounds = true
        lbl_cir.layer.cornerRadius = lbl_cir.layer.frame.size.width / 2
        lbl_cir.layer.masksToBounds = true
    }

    
}
