//
//  NotUserTableViewCell.swift
//  Compassion
//
//  Created by Geecon System Ltd. on 03/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class NotUserTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nblog_img: UIImageView!
    @IBOutlet weak var nblog_text: UITextView!
    @IBOutlet weak var nblog_lable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    

}
