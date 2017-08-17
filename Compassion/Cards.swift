//
//  Cards.swift
//  Compassion
//
//  Created by Geecon System Ltd. on 17/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class Cards: UIView {

    @IBOutlet weak var next_view: UIView!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.next_view.layer.cornerRadius = 18
        self.next_view.layer.masksToBounds = true
        
        
        
    }

    
}
