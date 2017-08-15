//
//  BlogTableViewCell.swift
//  Compassion
//
//  Created by Grevin on 26/07/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class BlogTableViewCell: UITableViewCell {


    @IBOutlet weak var desclbl: UILabel!
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var datelbl: UILabel!
    @IBOutlet weak var blogImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
