//
//  OfficialAnnouncementController.swift
//  cdb
//
//  Created by Brain Liao on 2017/12/23.
//  Copyright © 2017年 cdb. All rights reserved.
//


import UIKit
/** 系統消息*/
class OfficialAnnouncementController:ViewController,ClickListenerProtocol{
    /** Layout*/
    var officialAnnouncementLayout:OfficialAnnouncementLayout!
    /** 系統消息DataSource*/
    var officialAnnouncementTableDataSource:OfficialAnnouncementTableDataSource!
    /** 系統消息資料*/
    var officialAnnouncementObjects:[OfficialAnnouncementObject] = []
    /** 刷新Title*/
    let refreshTitle:String = "Slide down to Update"
    /** 載入中Title*/
    let loadingTitle:String = "Loading..."
    /** 刷新Control*/
    var refreshControl:UIRefreshControl!
    /** 現在是否載入中*/
    var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        //宣告Layout
        officialAnnouncementLayout = OfficialAnnouncementLayout(frame: self.view.frame,navigationBarFrame: self.navigationController?.navigationBar.frame,uiNavigationItem: self.navigationItem)
        officialAnnouncementLayout.loadView()
        view.addSubview(officialAnnouncementLayout)
        officialAnnouncementLayout.backgroundColor = UIColor.white
        addButtonAction()
        //初始化重新刷新及載入更多VIEW
        initRefleshAndLoadMoreView()
        /**初始化DataSource*/
        initTableViewDataSource()
        loadData(true)
        self.officialAnnouncementLayout?.back_btn!.addTarget(self,action:#selector(OfficialAnnouncementController.backView), for: .touchUpInside)
    }
    
    func backView()
    {
        
        //self.navigationController?.popViewControllerAnimated(true)
        let gg = ViewController()
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window!.rootViewController = gg
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if self.refreshControl?.isRefreshing == false && isLoading == true {
            self.refreshControl?.beginRefreshing()
            self.refreshControl?.attributedTitle = NSAttributedString(string: loadingTitle)
            officialAnnouncementLayout.tableView.contentOffset = CGPoint(x: 0, y: -self.refreshControl.frame.size.height);
        }
    }
    
    /** 初始化重新刷新及載入更多VIEW*/
    func initRefleshAndLoadMoreView(){
        //重新刷新
        refreshControl = UIRefreshControl()
        self.refreshControl?.attributedTitle = NSAttributedString(string: refreshTitle)
        self.refreshControl?.tintColor = UIColor.gray
        self.refreshControl?.addTarget(self, action: #selector(OfficialAnnouncementController.refresh), for: .valueChanged)
        officialAnnouncementLayout.tableView.addSubview(refreshControl)
    }
    
    /** 增加新增及返回鍵監聽事件*/
    func addButtonAction()
    {
        officialAnnouncementLayout.push_btn.addTarget(self, action: #selector(OfficialAnnouncementController.tappedButton(_:)), for: .touchUpInside)
        
    }
    
    /**  監聽Button事件*/
    func tappedButton(_ sender: UIButton!) {
        if(sender != nil)
        {
            if(sender.tag == officialAnnouncementLayout.Button_Push)
            {
                DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: true)
                }
                return
            }
        }
    }
    
    
    func refresh() {
        if self.refreshControl?.isRefreshing == true {
            self.refreshControl?.attributedTitle = NSAttributedString(string: loadingTitle)
        }
        loadData(true)
    }
    
    func refreshEnd(){
        self.refreshControl?.endRefreshing()
        self.refreshControl?.attributedTitle = NSAttributedString(string: self.refreshTitle)
    }
    
    
    /**初始化DataSource*/
    func initTableViewDataSource(){
        //建置固定欄位資料
        officialAnnouncementTableDataSource =  OfficialAnnouncementTableDataSource(datas: self.officialAnnouncementObjects,tableView: officialAnnouncementLayout.tableView,clickListenerProtocol: self)
        
        officialAnnouncementLayout.tableView.dataSource = officialAnnouncementTableDataSource
        officialAnnouncementLayout.tableView.delegate = officialAnnouncementTableDataSource
    }
    
    func loadData(_ isReflesh:Bool)
    {
        self.officialAnnouncementObjects = []
        let officialAnnouncementObject1 = OfficialAnnouncementObject()
        officialAnnouncementObject1.SYS_OfficialAnnouncement_ID = "1"
        officialAnnouncementObject1.Title = "關於58游戏新聞"
        officialAnnouncementObject1.Content = "我們提供最即時的頭條新聞 運動新聞 跟 遊戲新聞 如果想要讀完整的報導 點一下就帶您到完整的報導 未來也會提供更多的服務"
        officialAnnouncementObject1.CreateDate = "2017-04-25"
        
        let officialAnnouncementObject2 = OfficialAnnouncementObject()
        officialAnnouncementObject2.SYS_OfficialAnnouncement_ID = "2"
        officialAnnouncementObject2.Title = ""
        officialAnnouncementObject2.Content = ""
        officialAnnouncementObject2.CreateDate = ""
        
        let officialAnnouncementObject3 = OfficialAnnouncementObject()
        officialAnnouncementObject3.SYS_OfficialAnnouncement_ID = "3"
        officialAnnouncementObject3.Title = ""
        officialAnnouncementObject3.Content = ""
        officialAnnouncementObject3.CreateDate = ""
        self.officialAnnouncementObjects = [officialAnnouncementObject1]
        updateData()
    }
    
    func updateData()
    {
        DispatchQueue.main.async {
            self.officialAnnouncementTableDataSource.updateData(self.officialAnnouncementObjects)
            self.officialAnnouncementLayout.tableView.reloadData()
            self.refreshEnd()
        }
        
    }
    
    /**觸發點擊事件 - 無傳遞參數*/
    func DoClicks()
    {
        print("觸發返回事件")
    }
    /**觸發點擊事件 - 有傳遞參數*/
    func DoClicks(_ clickListenerCondition:ClickListenerCondition)
    {
        
        
        if(clickListenerCondition.object != nil)
        {
            let selObject = clickListenerCondition.object as! OfficialAnnouncementObject
            if(selObject.IsShow)
            {
                selObject.IsShow = false
            }else
            {
                selObject.IsShow = true
            }
            
            if(selObject.IsReaded == nil || selObject.IsReaded == "0")
            {
                selObject.IsReaded = "1"
            }
            
            
            var index = 0
            for obj in self.officialAnnouncementObjects
            {
                if(obj.SYS_OfficialAnnouncement_ID != nil)
                {
                    if(obj.SYS_OfficialAnnouncement_ID == selObject.SYS_OfficialAnnouncement_ID)
                    {
                        self.officialAnnouncementObjects[index] = selObject
                        break
                    }
                }
                index += 1
            }
            self.updateData()
        }
        print("觸發傳遞參數事件")
    }
}

