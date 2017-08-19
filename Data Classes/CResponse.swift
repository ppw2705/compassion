//
//  CResponse.swift
//  vannya
//
//  Created by Dyaneshwar Wagh/FTIL/New Ventures on 23/06/15.
//  Copyright (c) 2015 Financial Technologies. All rights reserved.
//

import Foundation


class CResponse
{
    var m_cMessageBuffer    : NSData!
    var m_nMsgCode          : Int!
    var m_cKey              : String!
    var m_nErrorCode        : Int16!
    var m_cErrStr           : String!
    
    func Fill(cData: NSData)
    {
        let lcJson = JSON(data: cData as Data)
        
        //print("data : %@", cData)

        NSLog("Response Fill : %@\n", NSString(data: cData as Data, encoding: String.Encoding.utf8.rawValue)!)
        //print(lcJson.rawString(NSUTF8StringEncoding, options:  NSJSONWritingOptions.PrettyPrinted))
        
        if lcJson["msgBuffer"] != nil
        {
            //m_cMessageBuffer = lcJson["msgBuffer"].rawValue.dataUsingEncoding(NSUTF8StringEncoding)
            m_cMessageBuffer = lcJson["msgBuffer"].rawString()?.data(using: String.Encoding.utf8) as NSData!
        }
        //m_cMessageBuffer = lcJson["msgBuffer"].rawValue.dataUsingEncoding(NSUTF8StringEncoding)
        m_nMsgCode = lcJson["msgCode"].intValue
        m_cKey = lcJson["key"].stringValue
        m_cErrStr = lcJson["errValue"].stringValue
        if lcJson["errCode"] == nil
        {
            m_nErrorCode = -1
            m_cErrStr = "ERROR_SOMETHING_WENT_WRONG"//.localized() //localization Arold T 15/12/2016
        }
        else
        {
            m_nErrorCode = lcJson["errCode"].int16Value
        }
    }
    
    func Fill(cJson: JSON)
    {
        print(cJson.rawString(String.Encoding.utf8, options:.prettyPrinted) ?? String())
        
        
        if cJson["msgBuffer"] != nil
        {
           // m_cMessageBuffer = cJson["msgBuffer"].rawValue.dataUsingEncoding(NSUTF8StringEncoding)
            m_cMessageBuffer = cJson["msgBuffer"].rawString()?.data(using: String.Encoding.utf8) as NSData!
        }
        //m_cMessageBuffer = lcJson["msgBuffer"].rawValue.dataUsingEncoding(NSUTF8StringEncoding)
        m_nMsgCode = cJson["msgCode"].intValue
        m_cKey = cJson["key"].stringValue
        m_cErrStr = cJson["errValue"].stringValue
        if cJson["errCode"] == nil
        {
            m_nErrorCode = -1
            m_cErrStr = "ERROR_SOMETHING_WENT_WRONG"//localization Arold T 15/12/2016
        }
        else
        {
            m_nErrorCode = cJson["errCode"].int16Value
        }
    }
}
