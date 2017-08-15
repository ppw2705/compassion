//
//  NotifyTableViewCell.swift
//  Compassion
//
//  Created by Grevin on 27/07/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class NotifyTableViewCell: UITableViewCell {

    @IBOutlet weak var notifyImage: UIImageView!
    @IBOutlet weak var notifyTitle: UILabel!
    @IBOutlet weak var notifydetail: UILabel!
    @IBOutlet weak var notifyClose: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutIfNeeded()
        
//        notifyImage.layer.cornerRadius = notifyImage.layer.frame.size.width / 2
//        notifyImage.layer.masksToBounds = true
        self.notifyImage.layer.cornerRadius = self.notifyImage.layer.frame.size.width / 2
        self.notifyImage.layer.masksToBounds = true

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        


    }

}
