//
//  PovertyTableViewCell.swift
//  Compassion
//
//  Created by Geecon System Ltd. on 19/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class PovertyTableViewCell: UITableViewCell {

    @IBOutlet weak var bloging: UIImageView!
    @IBOutlet weak var fb_obj: UIButton!
    @IBOutlet weak var tw_obj: UIButton!
    @IBOutlet weak var des_obj: UILabel!
    @IBOutlet weak var title: UITextView!
    @IBOutlet weak var day_date: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
