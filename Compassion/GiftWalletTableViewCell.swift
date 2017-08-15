//
//  GiftWalletTableViewCell.swift
//  CUKswift
//
//  Created by Geecon System Ltd. on 01/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class GiftWalletTableViewCell: UITableViewCell {

    @IBOutlet weak var name_lbl: UILabel!
    @IBOutlet weak var type_lbl: UILabel!
    @IBOutlet weak var amount_lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
