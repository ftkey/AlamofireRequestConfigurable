//: Please build the scheme 'AlamofireRequestConfigurablePlayground' first
import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true



import Alamofire
import AlamofireRequestConfigurable

import ObjectMapper
import ObjectMapperTransforms

import AlamofireObjectMapper


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


enum IPRouter: AlamofireRequestConfigurable {
    
    case show(ip: String?)
    case current
    
    var configuration: AlamofireRequestConfiguration {
        switch self {
            
        case .show(_) :
            return (
                method: .GET,
                URLString: "http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json",
                parameters: [:],
                encoding: .URL,
                headers: nil
            )
            
        case .current :
            return (
                method: .GET,
                URLString: "http://chaxun.1616.net/s.php?type=ip&output=json",
                parameters: [:],
                encoding: .URL,
                headers: nil
            )
            
        }
    }
}
var request:Alamofire.Request

request = Alamofire.request(IPRouter.show(ip: "117.85.69.244"))
request.responseJSON { (response:Response) in
    debugPrint(request)
    debugPrint(response.result.value)
}

request = Alamofire.request(IPRouter.current)
request.responseString { (response:Response) in
    debugPrint(request)
    debugPrint(response.result.value)
}



Alamofire.request(IPRouter.show(ip: nil)).responseObject { (response: Response<IPObject, NSError>) in
    print("IPObject : \(response.result.value?.toJSONString())" )
}












