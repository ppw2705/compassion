//
//  CRequest.swift
//  vannya
//
//  Created by Rohan Satam/FTIL/New Ventures on 14/01/16.
//  Copyright © 2016 FTNewVentures. All rights reserved.
//

import Foundation

//protocol IBaseMessage
//{
//    func GetParams() ->  [String:AnyObject]
//    
//    func Fill(cJson:JSON)
//}
//
//class CBaseMessage : IBaseMessage
//{
//    
//    func GetParams() ->  [String:AnyObject]
//    {
//        return [String:AnyObject]()
//    }
//    
//    func Fill(cJson:JSON)
//    {
//    }
//    
//    func Fill(cData: NSData!)
//    {
//        if cData != nil
//        {
//            let lcJson = JSON(data:cData)
//            self.Fill(lcJson)
//        }
//    }
//}


class CBaseMessage
{
    func GetParams() ->  [String:AnyObject]
    {
        return [String:AnyObject]()
    }

    func Fill(cJson:JSON)
    {
    }

    func Fill(cData: NSData!)
    {
        if cData != nil
        {
            let lcJson = JSON(data:cData as Data)
            self.Fill(cJson: lcJson)
        }
    }
}

class CRequest : CBaseMessage
{
    var m_nMessageCode     = Int(0)
    
    func GetJson() -> JSON
    {
        let lcJsonData = JSON(GetParams())
        return lcJsonData
    }
    
    func GetJsonWS()-> JSON
    {
        let lcJsonDataMsg      = GetJson()
        let lcJsonData = JSON(["MsgCode" : m_nMessageCode, "Msg":  "\(lcJsonDataMsg.rawString()!)"])
        return lcJsonData
    }
    
    func GetJsonString()-> String
    {
        let lcJsonData = GetJson()
        return lcJsonData.rawString()!
    }
    
    func GetJsonStringWS()-> String
    {
        let lcJsonData      = GetJsonWS()
        return lcJsonData.rawString()!
    }
    
    func GetJsonData()-> NSData!
    {
        let lcJsonData = GetJson()
        
        do
        {
            let lcData = try lcJsonData.rawData()
            return lcData as NSData!
        }
        catch let lcError as NSError
        {
            print(lcError.localizedDescription)
        }
        
        return nil
    }
    
    func GetJsonDataWS()-> NSData!
    {
        let lcJsonData = GetJsonWS()
        
        do
        {
            let lcData = try lcJsonData.rawData()
            return lcData as NSData!
        }
        catch let lcError as NSError
        {
            print(lcError.localizedDescription)
        }
        
        return nil
    }
}
