//
//  HTTPRequest.swift
//  Pods
//
//  Created by Futao on 16/6/20.
//
//
import Foundation
import Alamofire

public class HTTPRequest: AlamofireRequestConfigurable{
    public init(baseURL: String = "https://example.com", path: String = "", method: Alamofire.Method = .GET , encoding: Alamofire.ParameterEncoding = .URL, parameters: [String: AnyObject]? = [:], headers: [String: String]? = [:]) {
        self.baseURL = NSURL(string: baseURL)!
        self.path = path
        self.method = method
        self.encoding = encoding
        self.parameters = parameters
        self.headers = headers
    }
    
    public var baseURL: NSURL
    
    public var path: String
    
    public var method: Alamofire.Method
    
    public var encoding: Alamofire.ParameterEncoding
    
    public var parameters: [String: AnyObject]?
    
    public var headers: [String: String]?
    
    
}