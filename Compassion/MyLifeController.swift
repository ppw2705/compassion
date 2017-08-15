//
//  MyLifeController.swift
//  CUKswift
//
//  Created by Geecon System Ltd. on 29/07/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit
let kThresholdX = 12.0
let kThresholdY = 4.0


class MyLifeController: UIViewController {
    @IBOutlet weak var page_scroll: UIScrollView!
    var currentPage: Int = 0
    var _originalPoint = CGPoint.zero
    var _isHorizontalScroll: Bool = false
    var _isMultitouch: Bool = false
    var _currentChild: UIView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.page_scroll.contentSize = CGSize(width: self.view.frame.size.width, height: 700)
        //self.page_scroll.contentSize = CGSize(width: 1125 , height: 00)
        
//        [UIView animateWithDuration:2.0f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
//            scrollView.contentOffset = CGPointMake(x, y);
//            self.page_scroll.contentSize = CGSize(width: 1125 , height: 00)
//
//            } completion:NULL];
//
//
//    }
        UIView.animate(withDuration: 0.2, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
            self.page_scroll.contentOffset.x = CGFloat(350.byteSwapped)
        }, completion: nil)

    
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


    @IBAction func act_1(_ sender: Any) {
        
//        self.page_scroll.contentSize = CGSize(width: +562.5 , height: 00)
        


    }
    @IBAction func act_2(_ sender: Any) {
        
}
}
