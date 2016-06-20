//
//  AlamofireRequestConfigurable.swift
//  Pods
//
//  Created by Futao on 16/6/4.
//
//
import Foundation
import Alamofire


public protocol AlamofireRequestConfigurable : Alamofire.URLRequestConvertible {
    
    // The base URL.
    var baseURL: NSURL { get }
    // The path URL component. Request URL: NSURL(string: path, relativeToURL: baseURL)
    var path: String { get }
    // Alamofire.Method, Default = .GET
    var method: Alamofire.Method { get }
    // Alamofire.ParameterEncoding, Default = .URL
    var encoding: Alamofire.ParameterEncoding { get }
    // The URL parameters.
    var parameters: [String: AnyObject]? { get }
    // The URL headers.
    var headers: [String: String]? { get }
    // Alamofire.URLRequestConvertible.URLRequest
    var URLRequest: NSMutableURLRequest { get }
    
}

public extension AlamofireRequestConfigurable {
    
    
    public var path: String {
        return ""
    }
    public var method: Alamofire.Method {
        return Alamofire.Method.GET
    }
    public var encoding: Alamofire.ParameterEncoding {
        return Alamofire.ParameterEncoding.URL
    }
    
    public var parameters: [String: AnyObject]? {
        return [:]
    }
    
    public var headers: [String: String]? {
        return [:]
    }
    
    public var URLRequest: NSMutableURLRequest {
        
        var URL = baseURL
        if let pathURL = NSURL(string: path, relativeToURL: baseURL) {
            URL = pathURL
        }
        let mutableURLRequest = URLRequestBuilder(method, URL, headers: headers)
        let encodedURLRequest = encoding.encode(mutableURLRequest, parameters: parameters).0
        return encodedURLRequest;
    }
    
    private func URLRequestBuilder(
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




