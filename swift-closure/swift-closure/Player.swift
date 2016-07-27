//
//  Player.swift
//  swift-closure
//
//  Created by HanXujie on 16/7/27.
//  Copyright © 2016年 thinker. All rights reserved.
//

import UIKit

class Player: NSObject {

    var name: String?
    var score: Int = 0
    
    // 重载构造函数
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    // 防止没有键值造成崩溃
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    // 重写description方便调试
    override var description: String{
        let key = ["name","score"]
        
        return dictionaryWithValuesForKeys(key).debugDescription
        
    }
    
    
    
}
