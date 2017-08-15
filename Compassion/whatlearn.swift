//
//  whatlearn.swift
//  Compassion
//
//  Created by Geecon System Ltd. on 11/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class whatlearn: UIView {


    @IBOutlet weak var scroll_view: UIScrollView!
    
//    scroll_view.contentSize = CGSize(width:270, height: 650)


override func layoutSubviews() {
    super.layoutSubviews()
    
    
    scroll_view.contentSize = CGSize(width:270, height: 750)

}
}
