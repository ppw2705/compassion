//
//  SponsorplusController.swift
//  Compassion
//
//  Created by Geecon System Ltd. on 03/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class SponsorplusController: UIViewController {

    @IBOutlet weak var scroll_view: UIScrollView!
    @IBOutlet weak var circle_img: UIImageView!
    @IBOutlet weak var submit_view: UIView!
    @IBOutlet weak var circle_view: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.scroll_view.contentSize = CGSize(width:320, height: 1010)
        self.submit_view.layer.cornerRadius = 20
        self.submit_view.layer.masksToBounds = true
        
        self.circle_img.layer.cornerRadius = self.circle_img.layer.frame.size.width / 2
        self.circle_img.layer.masksToBounds = true


        self.circle_view.layer.cornerRadius = self.circle_view.layer.frame.size.width / 2
        self.circle_view.layer.masksToBounds = true

        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func back(_ sender: Any) {
        
        self.dismiss(animated: false, completion: nil)
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        view.window!.layer.add(transition, forKey: kCATransition)

    }
    
}
