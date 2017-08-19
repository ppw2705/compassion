//
//  SponserchildRequest.swift
//  Compassion
//
//  Created by Grevin on 19/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import Foundation


class SponserchildRequest : CRequest
{
    var UserId                         : String!

    
    override init()
    {
        super.init()
        self.UserId                     = ""

    }
    

    
    override func GetParams() ->  [String:AnyObject]
    {
        let lcParams: [String:AnyObject] = ["userid": self.UserId as AnyObject]
        
        NSLog("%@",lcParams)
        return lcParams
    }

}
