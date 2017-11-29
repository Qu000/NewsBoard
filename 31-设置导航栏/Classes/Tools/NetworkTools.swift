//
//  NetworkTools.swift
//  31-设置导航栏
//
//  Created by qujiahong on 2017/11/29.
//  Copyright © 2017年 瞿嘉洪. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case get
    case post
}

class NetworkTools {
    //fucn--OC的-方法
    //class func---Swift的+方法
    class func requestData(URLString : String, type : MethodType, parameter : [String : Any]? = nil, finishedCallback : @escaping (_ result : Any) -> ()) {
       
        let method = type  == .get ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(URLString, method: method, parameters: parameter).responseJSON { (response) in
            //1.校验是否有结果
            /*
            if let result = response.result.value {
                finishedCallback(result)
            }else{
                print(response.result.error)
            }
             */
            //1.校验是否有结果
            guard let result = response.result.value else {
                print(response.result.error)
                return
            }
            
            //2.将结果回调出去
            finishedCallback(result)
        }
    }
}
