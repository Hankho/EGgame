//
//  CommonAlertViewDelegate.swift
//  cdb
//
//  Created by Brain Liao on 2017/12/23.
//  Copyright © 2017年 cdb. All rights reserved.
//

import UIKit
import Foundation
class CommonAlertViewDelegate : NSObject, UIAlertViewDelegate {
    
    var alertButtonClickProtocol:AlertButtonClickProtocol!
    
    init(alertButtonClickProtocol: AlertButtonClickProtocol) {
        self.alertButtonClickProtocol = alertButtonClickProtocol
        super.init()
    }
    
    
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        print("click" + String(buttonIndex))
        if(alertButtonClickProtocol != nil)
        {
            let ac:AlertButtonClickCondition = AlertButtonClickCondition()
            ac.index = buttonIndex
            alertButtonClickProtocol.DoButtonClicks(ac)
        }
        
    }
}

