# AlamofireRequestConfigurable

[![Version](https://img.shields.io/cocoapods/v/AlamofireRequestConfigurable.svg?style=flat)](http://cocoapods.org/pods/AlamofireRequestConfigurable)
[![License](https://img.shields.io/cocoapods/l/AlamofireRequestConfigurable.svg?style=flat)](http://cocoapods.org/pods/AlamofireRequestConfigurable)
[![Platform](https://img.shields.io/cocoapods/p/AlamofireRequestConfigurable.svg?style=flat)](http://cocoapods.org/pods/AlamofireRequestConfigurable)

```
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

```

```
SUCCESS: {
    city = "\U65e0\U9521";
    country = "\U4e2d\U56fd";
    desc = "";
    district = "";
    end = "-1";
    isp = "";
    province = "\U6c5f\U82cf";
    ret = 1;
    start = "-1";
    type = "";
}
SUCCESS: ({"Ip":"117.85.69.244","Isp":"æ±èçæ é¡å¸ çµä¿¡","Browser":"","OS":"","QueryResult":1})
```