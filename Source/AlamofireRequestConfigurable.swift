//
//  AlamofireRequestConfigurable.swift
//  Pods
//
//  Created by Futao on 16/6/4.
//
//
import Foundation
import Alamofire

public typealias AlamofireRequestConfiguration = (
    method: Alamofire.Method,
    URLString: Alamofire.URLStringConvertible,
    parameters: [String: AnyObject]?,
    encoding: Alamofire.ParameterEncoding,
    headers: [String: String]?
)

public protocol AlamofireRequestConfigurable: Alamofire.URLRequestConvertible {
    var configuration: AlamofireRequestConfiguration { get }
}



public extension AlamofireRequestConfigurable {
    public var URLRequest: NSMutableURLRequest {
        
        let mutableURLRequest = URLRequest(configuration.method, configuration.URLString, headers: configuration.headers)
        let encodedURLRequest = configuration.encoding.encode(mutableURLRequest, parameters: configuration.parameters).0
        return encodedURLRequest;
    }
    
    private func URLRequest(
        method: Alamofire.Method,
        _ URLString: Alamofire.URLStringConvertible,
          headers: [String: String]? = nil)
        -> NSMutableURLRequest
    {
        let mutableURLRequest = NSMutableURLRequest(URL: NSURL(string: URLString.URLString)!)
        mutableURLRequest.HTTPMethod = method.rawValue
        
        if let headers = headers {
            for (headerField, headerValue) in headers {
                mutableURLRequest.setValue(headerValue, forHTTPHeaderField: headerField)
            }
        }
        
        return mutableURLRequest
    }
}





