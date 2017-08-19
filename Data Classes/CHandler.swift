//
//  CHandler.swift
//  vannya
//
//  Created by Rohan Satam/FTIL/New Ventures on 13/01/16.
//  Copyright © 2016 FTNewVentures. All rights reserved.
//

import Foundation

protocol PHTTPHandler
{
    func HTTPResponseCallback(cHttpResponse: Response) -> Void
    func HTTPSendRequest()-> Int
}

protocol PWSHandler
{
    func WSResponseCallback(cData: NSData) -> Void
    func WSSendRequest()-> Int
}


class CHandler: NSObject
{
    var m_cURL           : String!
  //  var m_cRequest       : HTTPSerializeProtocol = HTTPParameterSerializer()
    var m_cCallback      : ((_ cSender:NSObject,_ nErrorCode:Int16,_ cErrorString:String) -> Void)!
    
    init(completionHandler:((_ cSender:NSObject,_ nErrorCode:Int16,_ cErrorString:String) -> Void)!)
    {
        m_cCallback = completionHandler
    }
    
    func OnError(response: Response)
    {
    }
    
    func OnSuccess(cResponse: CResponse)
    {
    }
    
    func OnSuccessWithResponse(response: Response)
    {
        
    }
    
    func ProcessReceivedMessage(response: Response)
    {
        if let lcCallback = m_cCallback
        {
            if ((nil == response.statusCode))
            {
                let lcError = response.error
                print("error: \(lcError!.localizedDescription)")
               // lcCallback(self, CTDeOperationStatus.OS_FAILUIRE.rawValue , "ERROR_SOMETHING_WENT_WRONG") //localization Arold T 15/12/2016
                return //also notify app of failure as needed
            }
            
            if(401 == response.statusCode)
            {
                OnError(response: response)
                return
            }
            
           // if let data = response.responseObject as? NSData
            let lcjson = JSON(data: response.data as Data)
            if (lcjson != JSON.null)
            {
                //let lcjson = JSON(data: response.data as Data)
            
                let lcResponse = CResponse()
                lcResponse.Fill(cJson:lcjson)
                              
//                if(CDTeMessageCode.SYSTEM_LEVEL_ERROR_FROM_BL.rawValue == lcResponse.m_nMsgCode)
//                {
//                    OnError(response: response)
//                    return
//                }
//                
//                if(CTDeOperationStatus.OS_SUCCESS.rawValue == lcResponse.m_nErrorCode)
//                {
//                    OnSuccess(cResponse: lcResponse)
//                }
//                else
//                {
//                    OnSuccess(cResponse: lcResponse)
//                }
                
                if(nil == lcResponse.m_cMessageBuffer)
                {
                    OnSuccessWithResponse(response: response)
                }
            }
        }
    }
    
    func PrepareRequest(bIsGet:Bool = false)
    {
//        self.m_cRequest = HTTPTask()
//        
//        if(false == bIsGet)
//        {
//            self.m_cRequest.requestSerializer = JSONRequestSerializer()
//        }
//        
       // self.AppendHeaderBody()
    }
    
  /*  func AppendHeaderBody() -> [String : String]
    {
        
        
        
       // self.m_cRequest.requestSerializer.headers[StringConstants.HTTPHeaderConstants.g_cAppHeaderKey]          = StringConstants.HTTPHeaderConstants.g_cAppHeaderValue
       // self.m_cRequest.requestSerializer.headers[StringConstants.HTTPHeaderConstants.g_cAppVersionHeaderKey]   = g_cAPIVersion
        
        //self.m_cRequest.requestSerializer.headers[StringConstants.HTTPHeaderConstants.g_cAppModelTypeHeaderKey] = String(g_cFashionDataController.GetDeviceSize())
        //self.m_cRequest.requestSerializer.headers[StringConstants.HTTPHeaderConstants.g_cAppBLVersionHeaderKey] = "1"
        
         let lcCSRFHeaderKey = g_cViewController.GetCSRFHeaderKey()
        
           // m_cRequest.requestSerializer.headers[lcCSRFHeaderKey] = g_cViewController.GetCSRFTokenValue()
            
        let headerValues = ["APP" : "IOSApp","vnm" : "1.0.00",lcCSRFHeaderKey! : g_cViewController.GetCSRFTokenValue()] as [String : String]
            
        return headerValues
        
        
        
       // if g_cFashionDataController.GetCookieString() != nil
       // {
       //     self.m_cRequest.requestSerializer.headers[StringConstants.HTTPHeaderConstants.g_cAppCookieHeaderKey]   = g_cFashionDataController.GetSessionCookie()
       // }
    }*/
    
}
