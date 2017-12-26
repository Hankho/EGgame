//
//  ToolsSize.swift
//  cdb
//
//  Created by Brain Liao on 2017/12/23.
//  Copyright © 2017年 cdb. All rights reserved.
//

import UIKit
import Foundation
/** 計算寬高方法*/
class ToolsSize {
    /**
     計算文字寬度
     @param string 檢測字串
     @param withFont 文字格式
     */
    static func getSizeFromString(_ string:String, withFont font:UIFont)->CGFloat{
        let textSize = NSString(string: string ?? "").size(
            attributes: [ NSFontAttributeName:font ])
        return textSize.width
    }
    
    static func getHeightFromLimitWidth(_ limitWidth:CGFloat,string:String, withFont font:UIFont)->CGFloat{
        var tempLabel:UILabel? = UILabel()
        tempLabel!.font = font
        tempLabel!.text = string
        tempLabel!.frame = CGRect(x: 0,y: 0,width: limitWidth,height: 0)
        tempLabel!.numberOfLines = 0
        tempLabel!.lineBreakMode = .byWordWrapping
        tempLabel!.sizeToFit()
        let height = tempLabel!.frame.height
        tempLabel = nil
        return height
    }
}

