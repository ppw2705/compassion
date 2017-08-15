//
//  childCircle.swift
//  Compassion
//
//  Created by Grevin on 27/07/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import Foundation
import UIKit

class childCircle {
    var name: String!
    var images:UIImage!
    
    init(name:String,images:UIImage) {
        self.name = name;
        self.images = images;
    }
    
     func createCategory()->[childCircle]{
        return[
            childCircle(name:"Yaneth1",images:UIImage(named:"child4.jpg")!),
            childCircle(name:"Yaneth2",images:UIImage(named:"child4.jpg")!),
            childCircle(name:"Yaneth3",images:UIImage(named:"child4.jpg")!),
            childCircle(name:"Yaneth4",images:UIImage(named:"child4.jpg")!),
            childCircle(name:"Yaneth5",images:UIImage(named:"child4.jpg")!),
            childCircle(name:"Yaneth6",images:UIImage(named:"child4.jpg")!),
            childCircle(name:"Yaneth7",images:UIImage(named:"child4.jpg")!),
            childCircle(name:"Yaneth8",images:UIImage(named:"child4.jpg")!),
        ]
    }
}
