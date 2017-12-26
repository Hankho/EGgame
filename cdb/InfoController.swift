//
//  InfoController.swift
//  cdb
//
//  Created by Brain Liao on 2017/12/23.
//  Copyright © 2017年 cdb. All rights reserved.
//


import UIKit
/** 系統消息*/
class InfoController:ViewController,ClickListenerProtocol{
    /** Layout*/
    var officialAnnouncementLayout:InfoLayout!
    /** 系統消息DataSource*/
    var officialAnnouncementTableDataSource:InfoTableDataSource!
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
        officialAnnouncementLayout = InfoLayout(frame: self.view.frame,navigationBarFrame: self.navigationController?.navigationBar.frame,uiNavigationItem: self.navigationItem)
        officialAnnouncementLayout.loadView()
        view.addSubview(officialAnnouncementLayout)
      
        addButtonAction()
        //初始化重新刷新及載入更多VIEW
        initRefleshAndLoadMoreView()
        /**初始化DataSource*/
        initTableViewDataSource()
        loadData(true)
        self.officialAnnouncementLayout?.back_btn!.addTarget(self,action:#selector(InfoController.backView), for: .touchUpInside)
          officialAnnouncementLayout.backgroundColor = UIColor.white
        self.view.backgroundColor = UIColor.white
    }
    
    func backView()
    {
        
        // self.navigationController?.popViewControllerAnimated(true)
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
        self.refreshControl?.addTarget(self, action: #selector(InfoController.refresh), for: .valueChanged)
        officialAnnouncementLayout.tableView.addSubview(refreshControl)
    }
    
    /** 增加新增及返回鍵監聽事件*/
    func addButtonAction()
    {
        officialAnnouncementLayout.push_btn.addTarget(self, action: #selector(InfoController.tappedButton(_:)), for: .touchUpInside)
        
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
        officialAnnouncementTableDataSource =  InfoTableDataSource(datas: self.officialAnnouncementObjects,tableView: officialAnnouncementLayout.tableView,clickListenerProtocol: self)
        
        officialAnnouncementLayout.tableView.dataSource = officialAnnouncementTableDataSource
        officialAnnouncementLayout.tableView.delegate = officialAnnouncementTableDataSource
        
        officialAnnouncementLayout.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
    }
    
    func loadData(_ isReflesh:Bool)
    {
        self.officialAnnouncementObjects = []
        let officialAnnouncementObject1 = OfficialAnnouncementObject()
        officialAnnouncementObject1.SYS_OfficialAnnouncement_ID = "1"
        officialAnnouncementObject1.Title = "骰寶"
        officialAnnouncementObject1.Content = "一般稱為賭大小，是一種用骰子賭博的方法。骰寶是由各閒家向莊家下注。每次下注前，莊家先把三顆骰子放在有蓋的器皿內搖晃。當各閒家下注完畢，莊家便打開器皿並派彩。因為最常見的賭注是買骰子點數的大小（總點數為4至10稱作小，11至17為大，圍骰除外），故也常被稱為買大小（Tai-Sai)"
        officialAnnouncementObject1.CreateDate = " "
        officialAnnouncementObject1.IsShow = true
        
        
        
        let officialAnnouncementObject2 = OfficialAnnouncementObject()
        officialAnnouncementObject2.SYS_OfficialAnnouncement_ID = "2"
        officialAnnouncementObject2.Title = "百家樂"
        officialAnnouncementObject2.Content = "百家樂是撲克遊戲，亦是賭場中常見的賭博遊戲之一。百家樂源於義大利，十五世紀時期傳入法國，及至十九世紀時盛傳於英法等地。時至今日，百家樂是世界各地賭場中受歡迎的賭戲之一。於澳門的賭場中，百家樂賭桌的數目更是全球賭場之中最多。"
        officialAnnouncementObject2.CreateDate = " "
        officialAnnouncementObject2.IsShow = true
        
        let officialAnnouncementObject3 = OfficialAnnouncementObject()
        officialAnnouncementObject3.SYS_OfficialAnnouncement_ID = "3"
        officialAnnouncementObject3.Title = "魚蝦蟹"
        officialAnnouncementObject3.Content = "魚蝦蟹，又稱魚蝦蟹骰寶，是中國和越南傳統賭博遊戲的一種，在中國南方民間曾是相當普遍的賭博，直至現在人們仍然經常於新春期間進行作娛樂之用。"
        officialAnnouncementObject3.CreateDate = " "
        officialAnnouncementObject3.IsShow = true
        
        let officialAnnouncementObject4 = OfficialAnnouncementObject()
        officialAnnouncementObject4.SYS_OfficialAnnouncement_ID = "4"
        officialAnnouncementObject4.Title = "輪盤"
        officialAnnouncementObject4.Content = "輪盤（Roulette）是一種賭場常見的博彩遊戲，Roulette一詞在法語的意思解作小圓輪。輪盤一般會有37或38個數字，由莊荷負責在轉動的輪盤邊打珠，然後珠子落在該格的數字就是得獎號碼。"
        officialAnnouncementObject4.CreateDate = " "
        officialAnnouncementObject4.IsShow = true
        self.officialAnnouncementObjects = [officialAnnouncementObject1,officialAnnouncementObject2,officialAnnouncementObject3,officialAnnouncementObject4]
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

