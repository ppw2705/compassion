//
//  Facts.swift
//  Compassion
//
//  Created by Grevin on 10/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class Facts: UIView {

    @IBOutlet weak var scroll_me: UIScrollView!
    @IBOutlet weak var web_views: UIWebView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        scroll_me.contentSize = CGSize(width:0, height: 900)
        
        self.web_views.allowsInlineMediaPlayback = true
        self.web_views.loadHTMLString("<iframe width=\"\(self.web_views.frame.width)\" height=\"\(self.web_views.frame.height)\" src=\"https://www.youtube.com/embed/tAsE6NChXzM?playsinline=1\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)

        
    }


}
