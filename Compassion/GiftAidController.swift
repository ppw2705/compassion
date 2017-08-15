//
//  GiftAidController.swift
//  CUKswift
//
//  Created by Geecon System Ltd. on 01/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class GiftAidController: UIViewController {

    @IBOutlet weak var view_1: UIView!
    @IBOutlet weak var comment_text: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view_1.layer.cornerRadius = 20
        self.view_1.layer.masksToBounds = true
        self.comment_text.layer.borderWidth = 1
        self.comment_text.layer.borderColor = UIColor.init(colorLiteralRed: 220.0/255.0, green: 220.0/255.0, blue: 220.0/255.0, alpha: 1).cgColor
        self.comment_text.layer.cornerRadius = 10
        self.comment_text.layer.masksToBounds = true


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
