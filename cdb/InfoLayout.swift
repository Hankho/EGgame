//
//  InfoLayout.swift
//  cdb
//
//  Created by Brain Liao on 2017/12/23.
//  Copyright © 2017年 cdb. All rights reserved.
//


import UIKit
/** 系統消息維護介面*/
class InfoLayout: UIView {
    /** UINavigationController*/
    var uiNavigationItem:UINavigationItem?
    /** 規則說明*/
    var titleString:String = ""
    /** 內容*/
    var contentView:UIView = UIView()
    /** 寬間距*/
    let widthContent:CGFloat = 20.0
    /** 高間距*/
    let heightContent:CGFloat = 10.0
    /** 內容View - X座標*/
    var contentView_X:CGFloat = 0.0
    /** 內容View - Y座標*/
    var contentView_Y:CGFloat = 0.0
    /** 內容View - 寬*/
    var contentView_Width:CGFloat = 0.0
    /** 內容View - 高*/
    var contentView_Height:CGFloat = 0.0
    /** 返回按鈕*/
    let push_btn = UIButton()
    /** 返回按鈕Tag*/
    let Button_Push:Int = 0
    /** 機構消息管理 TableView*/
    var tableView:UITableView = UITableView()
    
    var titleView:UIView?
    
    var titleLabel:UILabel?
    
    var back_btn:UIButton?
    
    var contentHeight : CGFloat = 5
    
    var titleColorViewHeight : CGFloat = 10
    
    /**
     初始化
     @param uiNavigationItem UINavigationItem
     @param 座標及寬高
     */
    init(frame:CGRect,navigationBarFrame:CGRect?,uiNavigationItem:UINavigationItem) {
        
        
        super.init(frame: frame)
        let topBarHeight = UIApplication.shared.statusBarFrame.size.height
        var startY = topBarHeight
        if(topBarHeight >= 20)
        {
            startY = 20
        }
        var tempTitleView = UIView()
        titleView = tempTitleView
        let title_Font = UIFont(name: "Heiti TC", size: 22)
        // Title Label
        let now = Date()
        var tempTitleLabel = UILabel()
        titleLabel = tempTitleLabel
        titleLabel?.text = "規則說明"
        titleLabel?.textColor = UIColor.white
        titleLabel?.font = title_Font
        let titleWidth = ToolsSize.getSizeFromString((titleLabel?.text)!, withFont: (titleLabel?.font)!)
        if(titleWidth > frame.width){
            titleLabel?.frame = CGRect(x: 0,y: 0,width: frame.width,height: 0)
        }else{
            titleLabel?.frame = CGRect(x: frame.width/2 - titleWidth/2,y: contentHeight ,width: frame.width,height: 0)
        }
        titleLabel?.numberOfLines = 0
        titleLabel?.lineBreakMode = .byWordWrapping
        titleLabel?.sizeToFit()
        titleView?.frame = CGRect(x: 0,y: 20,width: frame.width,height: (titleLabel?.frame.height)! + contentHeight)
        titleView?.backgroundColor = ToolsHexToUIColor.transToUIColor(Colors.abcdefg)
        titleView?.addSubview(titleLabel!)
        
        var pb = UIButton()
        back_btn = pb
        back_btn!.setImage(UIImage(named:"back"), for: UIControlState())
        back_btn!.setImage(UIImage(named:"back"), for: .highlighted)
        back_btn!.frame = CGRect(x: 10, y: ((titleView?.frame.height)! - 30)/2, width: 30, height: 30)
        //  titleView?.addSubview(back_btn!)
        
        addSubview(titleView!);
        
        
        var limitHeight:CGFloat = 0
        if(topBarHeight > 20)
        {
            limitHeight = 20
        }
        contentView_X = 0.0
        contentView_Y = (titleView?.frame.origin.y)! + (titleView?.frame.height)!
        contentView_Width = frame.width
        contentView_Height = frame.height - ((titleView?.frame.origin.y)! + (titleView?.frame.height)!) - limitHeight
        
    }
    
    /** 載入畫面*/
    func loadView()
    {
        contentView.frame = CGRect(x: contentView_X,y: contentView_Y,width: contentView_Width,height: contentView_Height)
        addSubview(contentView)
        //重要經過測試若ContentView 僅TableView一個時,會自定偏移,故調整新增一個假的
        //固定欄位
        let fakeView:UIView = UIView()
        fakeView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        contentView.addSubview(fakeView)
        //固定欄位
        
        tableView = UITableView()
        tableView.frame = CGRect(x: 0,y: 0,width: contentView_Width,height: contentView_Height)
        //tableView.backgroundColor = UIColor.blueColor()
        contentView.addSubview(tableView)
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

