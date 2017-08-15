//
//  Food.swift
//  Compassion
//
//  Created by Grevin on 10/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class Food: UIView {


    @IBOutlet weak var scroll_me: UIScrollView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        scroll_me.contentSize = CGSize(width:0, height: 550)
        
    }

    
}
