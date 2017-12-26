//
//  MenuEnum.swift
//  cdb
//
//  Created by Brain Liao on 2017/12/23.
//  Copyright © 2017年 cdb. All rights reserved.
//


enum MenuEnum {
    case test1,
    test2,
    test3,
    test4
    //    ,
    //    Test4,
    //    Test5,
    //    Test6
    
    static func getTitle(_ menuEnum:MenuEnum) ->String
    {
        if(MenuEnum.test1 == menuEnum){
            return "最新新聞"
        }else if(MenuEnum.test2 == menuEnum){
            return "規則說明"
        }
        else if(MenuEnum.test3 == menuEnum){
            return "QRCode"
        }
        else if(MenuEnum.test4 == menuEnum){
            return "系统讯息"
        }
        //        else if(MenuEnum.Test5 == menuEnum){
        //            return "联络我们"
        //        }
        //        else if(MenuEnum.Test6 == menuEnum){
        //            return ""
        //        }
        return ""
    }
    
    static func getUrl(_ menuEnum:MenuEnum)->String
    {
        if(MenuEnum.test1 == menuEnum){
            return "1"
        }else if(MenuEnum.test2 == menuEnum){
            return "2"
        }
        else if(MenuEnum.test3 == menuEnum){
            return "3"
        }
        else if(MenuEnum.test4 == menuEnum){
            return "4"
        }
        //        else if(MenuEnum.Test5 == menuEnum){
        //            return ""
        //        }
        //        else if(MenuEnum.Test6 == menuEnum){
        //            return ""
        //        }
        return ""
    }
    
    static func getPhotoPath(_ menuEnum:MenuEnum) ->String
    {
        if(MenuEnum.test1 == menuEnum){
            return "new_icon"
        }else if(MenuEnum.test2 == menuEnum){
            return "game_icon"
        }
        else if(MenuEnum.test3 == menuEnum){
            return "qrcode_left.jpg"
        }
        else if(MenuEnum.test4 == menuEnum){
            return "info_icon"
        }
        //        else if(MenuEnum.Test5 == menuEnum){
        //            return "test5"
        //        }
        //        else if(MenuEnum.Test6 == menuEnum){
        //            return "test6"
        //        }
        return ""
    }
}
