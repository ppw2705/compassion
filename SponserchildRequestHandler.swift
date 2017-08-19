//
//  SponserchildRequestHandler.swift
//  Compassion
//
//  Created by Grevin on 19/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//


import Foundation

class SponserchildRequestHandler : CHandler, PHTTPHandler
{
    var CSponserchildRequest  =  SponserchildRequest()
    var CSponserchildResponse =  SponserchildResponse()
    
    
    
    override init(completionHandler:((_ cSender:NSObject, _ nErrorCode: Int16, _ cErrorString:String) -> Void)!)
    {
        super.init(completionHandler: completionHandler)

        
        m_cURL =  "http://services.compassionuk.org/RightNowFetchServices/RightNowFetchRest/RightNowFetchRest.svc/GetSponsoredChildList/?"
    }
    
    override func OnError(response: Response)
    {
        // g_cFashionDataController.DisconnectWebSocket()
        // g_cFashionDataController.ReAuthenticate()
    }
    
    override func OnSuccess(cResponse: CResponse)
    {
        if let lcCallback = m_cCallback
        {
//            if(CTDeOperationStatus.OS_SUCCESS.rawValue == cResponse.m_nErrorCode)
//            {
//                self.m_cUserRegistrationResponse.Fill(cdata: cResponse.m_cMessageBuffer)
//            }
            
            lcCallback(self, cResponse.m_nErrorCode, cResponse.m_cErrStr)
        }
    }
    
    func HTTPResponseCallback(cHttpResponse response: Response) -> Void
    {
        ProcessReceivedMessage(response: response)
        
    }
    
    func HTTPSendRequest()-> Int
    {
        self.PrepareRequest() //CR- WebFarm RohanS 17/11/2016
        // self.m_cRequest.POST(m_cURL, parameters: m_cUserRegistrationRequest.GetParams(), completionHandler: HTTPResponseCallback)
       // let headers = self.AppendHeaderBody()
        
        do
        {
          //  let operation = try HTTP.POST(m_cURL, parameters: CSponserchildRequest.GetParams(), headers: nil, requestSerializer: JSONParameterSerializer())
            let operation = try HTTP.GET(m_cURL, parameters: CSponserchildRequest.GetParams(), headers: nil, requestSerializer: JSONParameterSerializer())
            
            operation.start { response in
                print(response.description)
                self.HTTPResponseCallback(cHttpResponse: response)
            }
        }
        catch let error
        {
            print(error)
        }
        
        return 1
    }
}
