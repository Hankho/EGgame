//
//  newscell.swift
//  cdb
//
//  Created by Brain Liao on 2017/12/16.
//  Copyright © 2017年 cdb. All rights reserved.
//

import UIKit

class newscell: UICollectionViewCell {
    weak var game:GameController?
    weak var sport:SportController?
    weak var newss:NewsController?
    let titlelabel:UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.backgroundColor = UIColor.brown
        tl.textColor = UIColor.white
        tl.font = UIFont.boldSystemFont(ofSize: 10)
        tl.textAlignment = .center
        return tl
        
    }()
    let activity:UIActivityIndicatorView = {
        let act = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        act.translatesAutoresizingMaskIntoConstraints = false
        act.startAnimating()
        return act
        
    }()
    let authorlabel:UILabel = {
        let authorlabel = UILabel()
        authorlabel.translatesAutoresizingMaskIntoConstraints = false
        authorlabel.font = UIFont.systemFont(ofSize: 10)
        
        authorlabel.textColor = UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)
        return authorlabel
    }()
    let imageview:UIImageView = {
        let im = UIImageView()
        im.translatesAutoresizingMaskIntoConstraints = false
        //im.backgroundColor = UIColor.redColor()
        im.contentMode = .scaleAspectFill
        im.clipsToBounds = true
        return im
        
    }()
    let deslabel:UITextView = {
        let dl = UITextView()
        dl.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        dl.translatesAutoresizingMaskIntoConstraints = false
        // dl.backgroundColor = UIColor.orangeColor()
        return dl
    }()
    let timelabel:UILabel = {
        let timelabel = UILabel()
        timelabel.translatesAutoresizingMaskIntoConstraints = false
        timelabel.font = UIFont.systemFont(ofSize: 10)
        timelabel.textAlignment = .right
        timelabel.textColor = UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)
        return timelabel
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        //sport = SportController()
        //sport!.ccnew = self
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.lightGray.cgColor
        addSubview(titlelabel)
        addSubview(imageview)
        addSubview(deslabel)
        addSubview(authorlabel)
        addSubview(timelabel)
        addSubview(activity)
        titlelabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titlelabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titlelabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/7).isActive = true
        titlelabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        imageview.topAnchor.constraint(equalTo: titlelabel.bottomAnchor).isActive = true
        imageview.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        imageview.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageview.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 4/7).isActive = true
        
        deslabel.topAnchor.constraint(equalTo: imageview.bottomAnchor).isActive = true
        deslabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        deslabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        deslabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 2/7).isActive = true
        
        authorlabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 5).isActive = true
        authorlabel.leftAnchor.constraint(equalTo: leftAnchor,constant: 10).isActive = true
        authorlabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        authorlabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2).isActive = true
        
        timelabel.rightAnchor.constraint(equalTo: rightAnchor,constant: -10).isActive = true
        timelabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 5).isActive = true
        timelabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        timelabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2).isActive = true
        
        activity.centerYAnchor.constraint(equalTo: imageview.centerYAnchor).isActive = true
        activity.centerXAnchor.constraint(equalTo: imageview.centerXAnchor).isActive = true
        activity.widthAnchor.constraint(equalToConstant: 100).isActive = true
        activity.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    override func prepareForReuse() {
        imageview.image = nil
        super.prepareForReuse()
    }
    func stopanimate(){
        activity.stopAnimating()
        activity.hidesWhenStopped = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

