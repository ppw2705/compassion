//
//  VolunteerController.swift
//  Compassion
//
//  Created by Geecon System Ltd. on 03/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class VolunteerController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
