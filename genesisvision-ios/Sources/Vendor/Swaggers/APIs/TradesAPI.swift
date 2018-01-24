//
// TradesAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class TradesAPI {
    /**

     - parameter ipfsHashId: (query)  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func apiTradesIpfsHistoryGet(ipfsHashId: String? = nil, completion: @escaping ((_ data: TradesViewModel?,_ error: Error?) -> Void)) {
        apiTradesIpfsHistoryGetWithRequestBuilder(ipfsHashId: ipfsHashId).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     - GET /api/trades/ipfsHistory
     - examples: [{contentType=application/json, example={
  "trades" : [ {
    "volume" : 2.3021358869347655,
    "symbol" : "symbol",
    "dateOpen" : "2000-01-23T04:56:07.000+00:00",
    "ticket" : 6,
    "priceClose" : 5.962133916683182,
    "dateClose" : "2000-01-23T04:56:07.000+00:00",
    "priceOpen" : 1.4658129805029452,
    "login" : 0,
    "profit" : 5.637376656633329,
    "direction" : "Buy"
  }, {
    "volume" : 2.3021358869347655,
    "symbol" : "symbol",
    "dateOpen" : "2000-01-23T04:56:07.000+00:00",
    "ticket" : 6,
    "priceClose" : 5.962133916683182,
    "dateClose" : "2000-01-23T04:56:07.000+00:00",
    "priceOpen" : 1.4658129805029452,
    "login" : 0,
    "profit" : 5.637376656633329,
    "direction" : "Buy"
  } ]
}}]
     
     - parameter ipfsHashId: (query)  (optional)

     - returns: RequestBuilder<TradesViewModel> 
     */
    open class func apiTradesIpfsHistoryGetWithRequestBuilder(ipfsHashId: String? = nil) -> RequestBuilder<TradesViewModel> {
        let path = "/api/trades/ipfsHistory"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "ipfsHashId": ipfsHashId
        ])
        

        let requestBuilder: RequestBuilder<TradesViewModel>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
