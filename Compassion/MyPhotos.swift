//
//  MyPhotos.swift
//  Compassion
//
//  Created by Grevin on 03/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class MyPhotos: UIView, iCarouselDataSource, iCarouselDelegate {
    
    
    @IBOutlet var carouselView: iCarousel!
    var images = [UIImage]()
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        
        carouselView.dataSource = self
        carouselView.delegate = self
        images = [UIImage(named:"yaneth1")!,UIImage(named:"yaneth2")!,UIImage(named:"yaneth3")!,UIImage(named:"yaneth4")!,UIImage(named:"yaneth5")!]
        
        carouselView.reloadData()
        carouselView.isVertical = true
        carouselView.type = .rotary
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return images.count
    }
    
    func carousel(_ carousel:iCarousel, viewForItemAt index: Int, reusing view:UIView?) -> UIView {
        
        //Create a UIView
        let tempView = UIView(frame: CGRect(x:0, y:0, width: 220, height :50))
        
        //Create a UIImageView
        let frame = CGRect(x:0, y:0, width:220, height:50)
        tempView.contentMode = .center
        let imageView = UIImageView()
        imageView.frame = frame
        imageView.contentMode = .scaleAspectFill
        
        
        // set image to the imageView and add it to UIView
        imageView.image = images[index]
        tempView.addSubview(imageView)
        
        return tempView
        
    }
    
    func carousel(_ carousel: iCarousel, valueFor option:iCarouselOption, withDefault value:CGFloat) -> CGFloat {
        if option == iCarouselOption.spacing {
            print(value)
            return value * 1.2
        }
        
        return value
    }
}
