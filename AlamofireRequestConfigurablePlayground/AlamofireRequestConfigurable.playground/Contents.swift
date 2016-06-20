//: Please build the scheme 'AlamofireRequestConfigurablePlayground' first
import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true



import Alamofire
import AlamofireRequestConfigurable

import ObjectMapper
import ObjectMapperTransforms

import AlamofireObjectMapper
import AlamofireActivityLogger

struct  IPObject :Mappable {
    var city:String?
    var country:String?
    var desc:String?
    var district:String?
    var end:String?
    var isp:String?
    var province:String?
    var ret:Int?
    var start:Int?
    var type:String?
    
    init?(_ map: Map) {
        
    }
    mutating func mapping(map: Map) {
        
        city <- (map["city"],AnyToStringTransform())
        country <- (map["country"],AnyToStringTransform())
        desc <- (map["desc"],AnyToStringTransform())
        district <- (map["district"],AnyToStringTransform())
        end <- (map["end"],AnyToStringTransform())
        isp <- (map["isp"],AnyToStringTransform())
        province <- (map["province"],AnyToStringTransform())
        ret <- (map["ret"],AnyToIntTransform())
        start <- (map["start"],AnyToIntTransform())
        type <- (map["type"],AnyToStringTransform())
        
    }
    
}

// 模块化请求网络
struct IPRouter  {
    
    struct Current : AlamofireRequestConfigurable {
        ////////////////////////////////////////
        var baseURL: NSURL {
            return NSURL(string: "http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json")!
        }
        
        ////////////////////////////////////////

    }
    
    struct Show : AlamofireRequestConfigurable {
        
    
        var _parameters: [String : AnyObject]?
        

        init(parameters para:[String : AnyObject]?) {
            _parameters = para
        }
        
        
        
        ////////////////////////////////////////
        var baseURL: NSURL {
            return NSURL(string: "http://int.dpool.sina.com.cn/")!
        }
        
        var path: String  {
            return "iplookup/iplookup.php"
        }
        var method: Alamofire.Method  {
            return .GET
        }
        var parameters: [String : AnyObject]? {
            
//            return ["format":"json","ip":_ip]
//            return _parameters
            return ["format":"json","ip":"117.85.65.91"]
        }
        
        var headers: [String : String]?  {
            return ["XXX":"XXX"]
        }
        
        var encoding: Alamofire.ParameterEncoding {
            return .URL
        }
        ////////////////////////////////////////
  
    }
}
// 简易请求

class TestRequest : HTTPRequest {
    
    
}


var request:Alamofire.Request

//TEST1
request = Alamofire.request(IPRouter.Current()).log()
request.responseJSON { (response:Response) in
}

//TEST2
request = Alamofire.request(IPRouter.Show(parameters: nil)).log()
request.responseString { (response:Response) in
}

//TEST3
Alamofire.request(IPRouter.Current()).log().responseObject { (response: Response<IPObject, NSError>) in
    print("IPObject : \(response.result.value?.toJSONString())" )
}

//TEST4
Alamofire.request(HTTPRequest()).log().responseString { (response:Response) in

}
//TEST6
Alamofire.request(TestRequest()).log().responseString { (response:Response) in
}
//TEST5
Alamofire.request(HTTPRequest(baseURL: "http://r.qzone.qq.com/cgi-bin/", path: "user/cgi_personal_card", method: .GET, encoding: .URL, parameters: ["qq":"11386846"], headers: [:])).log().responseString { (response:Response) in
}















