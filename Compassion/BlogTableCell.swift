//
//  BlogTableCell.swift
//  CUKswift
//
//  Created by Geecon System Ltd. on 01/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class BlogTableCell: UITableViewCell {
    
    
    @IBOutlet weak var blog_img: UIImageView!
    @IBOutlet weak var blog_des: UITextView!
    @IBOutlet weak var fb_btn: UIButton!
    @IBOutlet weak var tw_btn: UIButton!
    @IBOutlet weak var title_lbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
