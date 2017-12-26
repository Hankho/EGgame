//
//  MenuLayout.swift
//  cdb
//
//  Created by Brain Liao on 2017/12/23.
//  Copyright © 2017年 cdb. All rights reserved.
//


import UIKit

class MenuLayout : UIView{
    
    var contentHeight : CGFloat = 5
    
    var contentWidth : CGFloat = 10
    
    var icon_WidthAndHeight : CGFloat = 80
    
    var iconView:UIView?
    
    var iconViewArray1:[UIView] = []
    
    
    
    //var iconViewArray2:[UIView] = []
    
    let topBarHeight = UIApplication.shared.statusBarFrame.size.height
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //固定欄位
        let fakeView:UIView = UIView()
        fakeView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        addSubview(fakeView)
        
        var startY = topBarHeight
        if(topBarHeight > 20)
        {
            startY = 0
        }
        
        var bannerImage = UIImageView()
        bannerImage.contentMode = .scaleAspectFill
        bannerImage.frame = CGRect(x: 0,y: 20,width:frame.width,height:frame.height)
        //bannerImage.frame = CGRect(x: 0,y: startY,width: frame.width,height: 710)
        bannerImage.image = UIImage(named: "top_banner")
        
        addSubview(bannerImage)
        var iconContent = (frame.width - (icon_WidthAndHeight * 4))/5
        var nowX :CGFloat = 0
        var nowY :CGFloat = iconContent
        var index : Int = 0
        var tempIconView = UIView()
        iconView = tempIconView
        let menu_Font = UIFont(name: "Heiti TC", size: 12)
        for menu in  Setting.Menus1
        {
            index = index + 1
            var btnView = UIButton()
            btnView.setImage(UIImage(named:MenuEnum.getPhotoPath(menu)), for: UIControlState())
            btnView.frame = CGRect(x: 0,y: 0,width: icon_WidthAndHeight,height: icon_WidthAndHeight)
            
            let tw = UIView()
            tw.frame = CGRect(x: nowX + iconContent,y: nowY,width: icon_WidthAndHeight,height: icon_WidthAndHeight)
            var iconImage = UIImage(named: MenuEnum.getPhotoPath(menu))
            var imageView = UIImageView(image: iconImage)
            imageView.frame = CGRect(x:frame.width/30,y: 0,width: icon_WidthAndHeight/1.5,height: icon_WidthAndHeight/1.5)
            tw.addSubview(imageView)
            var menuLabel = UILabel()
            menuLabel.font = menu_Font
            menuLabel.text = MenuEnum.getTitle(menu)
            menuLabel.textColor = UIColor.white
            let menuLabelWidth = ToolsSize.getSizeFromString(menuLabel.text!, withFont: menuLabel.font)
            
            menuLabel.frame = CGRect(x: (icon_WidthAndHeight - menuLabelWidth)/2,y: imageView.frame.origin.y + imageView.frame.height,width: menuLabelWidth,height: menuLabel.font.lineHeight);
            
            tw.addSubview(menuLabel)
            iconView?.addSubview(tw)
            iconViewArray1.append(tw)
            
            nowX = tw.frame.origin.x + tw.frame.width
            if(index == Setting.Menus1.count)
            {
                nowY = tw.frame.origin.y + tw.frame.height + iconContent
            }
        }
        //        index = 0
        //        nowX = 0
        //        iconContent = (frame.width - (icon_WidthAndHeight * 2))/3
        //        for menu in  Setting.Menus2
        //        {
        //            index = index + 1
        //            var btnView = UIButton()
        //            btnView.setImage(UIImage(named:MenuEnum.getPhotoPath(menu)), forState: .Normal)
        //            btnView.frame = CGRectMake(0,0,icon_WidthAndHeight,icon_WidthAndHeight)
        //
        //            let tw = UIView()
        //            tw.frame = CGRectMake(nowX + iconContent,nowY,icon_WidthAndHeight,icon_WidthAndHeight)
        //            var iconImage = UIImage(named: MenuEnum.getPhotoPath(menu))
        //            var imageView = UIImageView(image: iconImage)
        //            imageView.frame = CGRectMake(0,0,icon_WidthAndHeight,icon_WidthAndHeight)
        //            tw.addSubview(imageView)
        //            var menuLabel = UILabel()
        //            menuLabel.font = menu_Font
        //            menuLabel.text = ""
        //            let menuLabelWidth = ToolsSize.getSizeFromString(menuLabel.text!, withFont: menuLabel.font)
        //
        //            menuLabel.frame = CGRectMake((icon_WidthAndHeight - menuLabelWidth)/2,imageView.frame.origin.y + imageView.frame.height,menuLabelWidth,menuLabel.font.lineHeight);
        //
        //            tw.addSubview(menuLabel)
        //            iconView?.addSubview(tw)
        //            iconViewArray2.append(tw)
        //
        //            nowX = tw.frame.origin.x + tw.frame.width
        //            if(index == Setting.Menus2.count)
        //            {
        //                nowY = tw.frame.origin.y + tw.frame.height + iconContent
        //            }
        //        }
        
        
        iconView?.frame = CGRect(x: 0,y: frame.height-nowY+10,
                                 width: frame.width,height: nowY)
        addSubview(iconView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

