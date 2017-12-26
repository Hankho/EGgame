//
//  FakeViewController.swift
//  cdb
//
//  Created by Brain Liao on 2017/12/23.
//  Copyright © 2017年 cdb. All rights reserved.
//


import UIKit

class FakeViewController: UIViewController ,UIGestureRecognizerDelegate,UIWebViewDelegate{
    
    var menuLayout:MenuLayout?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        
        
        self.navigationController?.interactivePopGestureRecognizer!.delegate = self
        var tempLayout = MenuLayout(frame: self.view.frame)
        menuLayout = tempLayout
        self.view.addSubview(menuLayout!)
        menuLayout?.backgroundColor = UIColor.clear
        initSettingTap();
        self.view.backgroundColor = UIColor.clear
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func gotoUrl(_ sender: UITapGestureRecognizer){
        if(!ToolsString.isEmpty(UrlDAO.getUrl()))
        {
            openLink(UrlDAO.getUrl()!);
            
        }
    }
    
    func openLink(_ str:String){
        DispatchQueue.main.async(execute: {
            if let checkURL = URL(string: UrlDAO.getUrl()!) {
                if UIApplication.shared.openURL(checkURL) {
                    
                }
            }
        });
    }
    
    
    func showAlert(_ message : String)
    {
        DispatchQueue.main.async(execute: {
            let alert : UIAlertView = UIAlertView(title: "提示", message: message,       delegate: nil, cancelButtonTitle: "确定")
            alert.show()
        })
    }
    
    
    func initSettingTap()
    {
        
        var i:Int = 0
        for v in (self.menuLayout?.iconViewArray1)!
        {
            v.isUserInteractionEnabled = true
            v.tag = i
            i += 1
            let vr = UITapGestureRecognizer(target:self, action: #selector(FakeViewController.gotoNextView1(_:)))
            v.addGestureRecognizer(vr)
            
        }
    }
    
    //去下一页的方法
    func gotoNextView1(_ sender: UITapGestureRecognizer){
        let menuEnum:MenuEnum = Setting.Menus1[(sender.view?.tag)!]
        
        //初始化第二页的控制器
        let nextVC = QRCodeController()
       
        
        if(MenuEnum.getUrl(menuEnum) == "1")
        {
            let nextVC = TabNewController()
            
            DispatchQueue.main.async(execute: {
                self.navigationController?.pushViewController(nextVC, animated: true)
            })

        }else if(MenuEnum.getUrl(menuEnum) == "2"){
            let nextVC = InfoController()
            DispatchQueue.main.async(execute: {
                self.navigationController?.pushViewController(nextVC, animated: true)
            })
        }else if(MenuEnum.getUrl(menuEnum) == "3"){
             let nextVC = QRCodeController()
            DispatchQueue.main.async(execute: {
                self.navigationController?.pushViewController(nextVC, animated: true)
            })
        }
        else if(MenuEnum.getUrl(menuEnum) == "4"){
            let nextVC = OfficialAnnouncementController()
            DispatchQueue.main.async(execute: {
                self.navigationController?.pushViewController(nextVC, animated: true)
            })
            

        }
    }
    
    //去下一页的方法
    func gotoNextView2(_ sender: UITapGestureRecognizer){
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

