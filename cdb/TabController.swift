//
//  TabController.swift
//  cdb
//
//  Created by Brain Liao on 2017/12/16.
//  Copyright © 2017年 cdb. All rights reserved.
//

import UIKit

class TabNewController: UITabBarController {
    /* if(MenuEnum.Test1 == menuEnum){
     return "高尔夫規則"
     }else if(MenuEnum.Test2 == menuEnum){
     return "系统讯息"
     }
     else if(MenuEnum.Test3 == menuEnum){
     return "增加自订规则"
     }*/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view1 = UINavigationController(rootViewController: NewsController())
        view1.tabBarItem = UITabBarItem(title: "世界頭條新聞", image: UIImage(named: "ic1.png")?.withRenderingMode(.alwaysOriginal), tag: 1)
        let view2 = UINavigationController(rootViewController: SportController())
        view2.tabBarItem = UITabBarItem(title: "運動新聞", image: UIImage(named: "i_company_announce.png")?.withRenderingMode(.alwaysOriginal), tag: 2)
        let view3 = UINavigationController(rootViewController: GameController())
        view3.tabBarItem = UITabBarItem(title: "經濟新聞", image: UIImage(named: "ii.png")?.withRenderingMode(.alwaysOriginal), tag: 3)
       
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        viewControllers = [view1,view2,view3]
        
        self.view.backgroundColor = UIColor.white
    }
    
    
}

