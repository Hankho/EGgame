//
//  VersionAPIDAO.swift
//  cdb
//
//  Created by Brain Liao on 2017/11/7.
//  Copyright © 2017年 cdb. All rights reserved.
//

import Foundation
class VersionAPIDAO {
    
    static let apiURL = "http://www.54gamer.com/appapi?station=eggaming&platform=ios"
    
    static let openURL = "http://www.54gamer.com/verify?station=eggaming";
    
    // static let apiURL = ""
    static func isOpen(_ success:@escaping () -> Void,failure:@escaping (String) -> Void) -> Bool {
        let sendStr:String = ""
        print(sendStr)
        var obj:ImageRep!
        APIProcess.SendAsynchronousRequest(openURL, sendContent: sendStr, apiSelect: "", apiRequest: sendStr, success: { (str,response:URLResponse?) -> Void in
            
            if str != "" {
                if("{\"1\"}" == str){
                    success();
                    return;
                }
                
            }
            failure("call api 失敗")
        }) { (str) -> Void in
            print("call api 失敗");
            failure(str)
            
        }
        return false
    }

    
    // static let apiURL = ""
    static func getVersion(_ success:@escaping (ImageRep!) -> Void,failure:@escaping (String) -> Void) -> Bool {
        let sendStr:String = ""
        print(sendStr)
         var obj:ImageRep!
        APIProcess.SendAsynchronousRequest(apiURL, sendContent: sendStr, apiSelect: "", apiRequest: sendStr, success: { (str,response:URLResponse?) -> Void in
            if str != "" {
                let parserObj = ImageRep(JSONString:str)
                if(parserObj != nil && parserObj?.result != nil){
                    obj = parserObj
                    success(obj)
                    return;
                }
                
            }
            failure("call api 失敗")
        }) { (str) -> Void in
            print("call api 失敗");
            failure(str)
            
        }
        return false
    }
}

