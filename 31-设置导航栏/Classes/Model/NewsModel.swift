//
//  NewsModel.swift
//  31-设置导航栏
//
//  Created by qujiahong on 2017/11/29.
//  Copyright © 2017年 瞿嘉洪. All rights reserved.
//

import UIKit

class NewsModel: NSObject {
    // MARK: - 模型属性
    var replyCount : Int = 0
    var title : String = ""
    var source : String = ""
    var imgsrc : String = ""
   
    // MARK: - 定义字典转模型的构造函数
    init(dict : [String : Any]){
        super.init()
        
        setValuesForKeys(dict)
    }

    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        //只用到了部分属性，有些属性并没有用到，如果不重写，就会崩掉
    }
}
