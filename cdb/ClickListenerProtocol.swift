//
//  ClickListenerProtocol.swift
//  cdb
//
//  Created by Brain Liao on 2017/12/23.
//  Copyright © 2017年 cdb. All rights reserved.
//

import Foundation
protocol ClickListenerProtocol {
    /**觸發點擊事件 - 無傳遞參數*/
    func DoClicks()
    /**觸發點擊事件 - 有傳遞參數*/
    func DoClicks(_ clickListenerCondition:ClickListenerCondition)
    
}
