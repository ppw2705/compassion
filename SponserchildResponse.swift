//
//  SponserchildResponse.swift
//  Compassion
//
//  Created by Grevin on 19/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import Foundation

class SponserchildResponse : NSObject
{
   
    
    var CSponserChildArray  : [SponserChildArray]!
 

    
    override init()
    {
     
        self.CSponserChildArray              = [SponserChildArray]()
    }
    
    

    
    
     func Fill(cJson:JSON)
    {
        

    }
    
    func Fill(cData: NSData!)
    {
        if cData != nil
        {
            NSLog("\nResponse : %@", NSString(data: cData as Data, encoding: String.Encoding.utf8.rawValue)!)
            let lcJson = JSON(data:cData as Data)
            
//            self.CSponserChildArray.removeAll(keepingCapacity: false)
//            
//            
//            for (index, subJson):(String , JSON) in lcJson[""]
//            {
//                let lcSubSpeciesDetails = SponserChildArray()
//                lcSubSpeciesDetails.Fill(cData: subJson)
//                self.CSponserChildArray.append(lcSubSpeciesDetails)
//            }
        }
    }
    

    


//    func Fill(cdata: NSData)
//    {
//        let lcJson = JSON(data:cdata as Data)
//        NSLog("%@", NSString(data: cdata as Data, encoding: String.Encoding.utf8.rawValue)!)
//       
//  
//        
//        }

}
