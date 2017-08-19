//
//  SponserChildArray.swift
//  Compassion
//
//  Created by Grevin on 19/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import Foundation

class SponserChildArray : NSObject
{
    var Birthdate                   : String!
    var ChildName                   : String!
    
    
    override init()
    {
        self.Birthdate  = ""
        self.ChildName  = ""
    }
    

    func Fill(cData: NSData!)
    {
        if cData != nil
        {
            let lcJson = JSON(data:cData as Data)
            self.Birthdate       = lcJson["Birthdate"].stringValue
            self.ChildName       =  lcJson["FirstName"].stringValue
        }
    
    }

}




