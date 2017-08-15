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

    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        ageLbl.layer.cornerRadius = ageLbl.layer.frame.size.width / 2
        ageLbl.layer.masksToBounds = true
        countryV.layer.cornerRadius = countryV.layer.frame.size.width / 2
        countryV.layer.masksToBounds = true
        //self.layer.cornerRadius = 10.0
        //self.clipsToBounds = true
    }
}
