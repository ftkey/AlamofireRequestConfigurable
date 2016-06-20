# AlamofireRequestConfigurable

[![Version](https://img.shields.io/cocoapods/v/AlamofireRequestConfigurable.svg?style=flat)](http://cocoapods.org/pods/AlamofireRequestConfigurable)
[![License](https://img.shields.io/cocoapods/l/AlamofireRequestConfigurable.svg?style=flat)](http://cocoapods.org/pods/AlamofireRequestConfigurable)
[![Platform](https://img.shields.io/cocoapods/p/AlamofireRequestConfigurable.svg?style=flat)](http://cocoapods.org/pods/AlamofireRequestConfigurable)

```
import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true


import Alamofire
import AlamofireRequestConfigurable

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

```

```
//TEST1
request = Alamofire.request(IPRouter.Current()).log()
request.responseJSON { (response:Response) in
}

//TEST2
request = Alamofire.request(IPRouter.Show(parameters: nil)).log()
request.responseString { (response:Response) in
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