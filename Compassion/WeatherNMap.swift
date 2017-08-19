//
//  WeatherNMap.swift
//  Compassion
//
//  Created by Grevin on 10/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit
import GoogleMaps

class WeatherNMap: UIView {


    @IBOutlet weak var view_1: UIView!
    @IBOutlet weak var scroll_me: UIScrollView!
    @IBOutlet weak var view_2: UIView!
    @IBOutlet weak var view_3: UIView!
    @IBOutlet weak var view_4: UIView!
    @IBOutlet weak var mapView: GMSMapView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        scroll_me.contentSize = CGSize(width:0, height: 630)
        
        self.view_1.layer.cornerRadius = 4
        self.view_1.layer.masksToBounds = true
        
        self.view_2.layer.cornerRadius = 4
        self.view_2.layer.masksToBounds = true
        
        self.view_3.layer.cornerRadius = 4
        self.view_3.layer.masksToBounds = true
        
        self.view_4.layer.cornerRadius = 4
        self.view_4.layer.masksToBounds = true


        
    }

}
