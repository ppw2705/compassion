//
//  BlogHeaderTableViewCell.swift
//  Compassion
//
//  Created by Grevin on 31/07/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class BlogHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var circle_img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        self.circle_img.layer.cornerRadius = self.circle_img.layer.frame.size.width / 2
        self.circle_img.layer.masksToBounds = true

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
