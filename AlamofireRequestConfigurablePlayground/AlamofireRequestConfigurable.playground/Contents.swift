//: Please build the scheme 'AlamofireRequestConfigurablePlayground' first
import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true



import Alamofire
import AlamofireRequestConfigurable

enum IPRouter: AlamofireRequestConfigurable {
    
    case Show(ip: String?)
    case Current()
    
    var configuration: AlamofireRequestConfiguration {
        switch self {
            
        case .Show(_) :
            return (
                method: .GET,
                URLString: "http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json",
                parameters: [:],
                encoding: .URL,
                headers: [:]
            )
            
        case .Current() :
            return (
                method: .GET,
                URLString: "http://chaxun.1616.net/s.php?type=ip&output=json",
                parameters: [:],
                encoding: .URL,
                headers: [:]
            )
            
        }
    }
}

Alamofire.request(IPRouter.Show(ip: "117.85.69.244")).responseJSON { (response:Response) in
    
    debugPrint(response.result)
    
}

Alamofire.request(IPRouter.Current()).responseString { (response:Response) in
    
    debugPrint(response.result)
    
}
