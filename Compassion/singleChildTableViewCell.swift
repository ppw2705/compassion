//
//  singleChildTableViewCell.swift
//  Compassion
//
//  Created by Grevin on 27/07/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class singleChildTableViewCell: UITableViewCell {

    @IBOutlet weak var singleChildView: UIView!
    @IBOutlet weak var childImage: UIImageView!
    @IBOutlet weak var Namelbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        childImage.clipsToBounds            = true;
        childImage.layer.cornerRadius = childImage.frame.size.height/2;
        childImage.layer.borderWidth = 7;
        childImage.layer.borderColor = UIColor(
            red: 66.0/255.0,
            green: 97.0/255.0,
            blue: 163.0/255.0,
            alpha: CGFloat(1.0)
            ).cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
