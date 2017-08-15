//
//  pagingCollectionViewCell.swift
//  Compassion
//
//  Created by Grevin on 01/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class pagingCollectionViewCell: UICollectionViewCell {
  
    @IBOutlet weak var Img: UIImageView!
    @IBOutlet weak var Name: UILabel!

    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        layoutIfNeeded()
    }
    
}
