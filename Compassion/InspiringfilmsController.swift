//
//  InspiringfilmsController.swift
//  CUKswift
//
//  Created by Geecon System Ltd. on 27/07/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class InspiringfilmsController: UIViewController {
    
    @IBOutlet weak var web_views: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.web_views.allowsInlineMediaPlayback = true
        self.web_views.loadHTMLString("<iframe width=\"\(self.web_views.frame.width)\" height=\"\(self.web_views.frame.height)\" src=\"https://www.youtube.com/embed/tAsE6NChXzM?playsinline=1\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)



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
