//
//  OfficialAnnouncementObject.swift
//  cdb
//
//  Created by Brain Liao on 2017/12/23.
//  Copyright © 2017年 cdb. All rights reserved.
//

import Foundation
class OfficialAnnouncementObject:NSObject {
    
    /** 系統消息(官方公告)流水號*/
    var SYS_OfficialAnnouncement_ID:String!
    /** 標題*/
    var Title:String!
    /** 內容*/
    var Content:String!
    /** 建立時間*/
    var CreateDate:String!
    /** 是否已讀 0:未讀 1:已讀*/
    var IsReaded:String!
    /** 是否展開*/
    var IsShow:Bool = false
}

