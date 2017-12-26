//
//  SportController.swift
//  cdb
//
//  Created by Brain Liao on 2017/12/16.
//  Copyright © 2017年 cdb. All rights reserved.
//


import UIKit

class SportController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var imagecache:NSCache = { () -> NSCache<AnyObject, AnyObject> in
        let ic = NSCache<AnyObject, AnyObject>()
        return ic
    }()
    lazy var collectionview:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(newscell.self, forCellWithReuseIdentifier: "cellid")
        cv.delegate = self
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        return cv
        
    }()
    var newsarray:[news] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        navigationItem.title = "運動新聞"
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.black]
        view.addSubview(collectionview)
        collectionview.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        collectionview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionview.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        callapi()
        //        let newbar = UIButton(type: UIButtonType.System)
        //        newbar.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
        //        newbar.layer.cornerRadius = 5
        //        newbar.setTitle("Logout", forState: .Normal)
        //        newbar.layer.borderColor = UIColor.darkGrayColor().CGColor
        //        newbar.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        //        newbar.backgroundColor = UIColor.whiteColor()
        //        newbar.layer.borderWidth = 1
        //        newbar.addTarget(self, action: #selector(logout), forControlEvents: .TouchUpInside)
        //        let jd = UIBarButtonItem(customView: newbar)
        //        navigationItem.rightBarButtonItem = jd
    }
    //    func logout(){
    //        NSUserDefaults.standardUserDefaults().setInteger(0, forKey: "login")
    //        self.presentViewController(LoginController(), animated: true, completion: nil)
    //    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsarray.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let url = URL(string: newsarray[indexPath.item].url)
        UIApplication.shared.openURL(url!)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dd = collectionview.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! newscell
        dd.sport = self
        dd.titlelabel.backgroundColor = UIColor(red: 200/255, green: 0, blue: 0, alpha: 1)
        dd.titlelabel.text = newsarray[indexPath.item].title
        dd.deslabel.text = newsarray[indexPath.item].description
        if let cacheimage = imagecache.object(forKey: newsarray[indexPath.item].urlimage as AnyObject) as? UIImage {
            dd.stopanimate()
            dd.imageview.image = cacheimage
        }
        else
        {
            DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.background).async(execute: {
                
                let url = URL(string: self.newsarray[indexPath.item].urlimage!)
                do{
                    let data = try Data(contentsOf: url!)
                    let im = UIImage(data: data)
                    self.imagecache.setObject(im!, forKey: self.newsarray[indexPath.item].urlimage as AnyObject)
                    DispatchQueue.main.async(execute: {
                        dd.stopanimate()
                        dd.imageview.image = im
                    })
                }
                catch{
                    
                }
            })
            
        }
        
        if(newsarray[indexPath.item].author != nil)
        {
            dd.authorlabel.text = "source: "+newsarray[indexPath.item].author!
        }
        else
        {
            dd.authorlabel.text = nil
        }
        if(newsarray[indexPath.item].date != nil)
        {
            let str = newsarray[indexPath.item].date
            
            let dateFor: DateFormatter = DateFormatter()
            dateFor.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            let yourdate:Date = dateFor.date(from: str!)!
            let cal = Calendar.current
            var com = (cal as NSCalendar).components([.year,.month,.day,.hour,.minute], from: yourdate)
            var ampm = ""
            var minute = ""
            
            if(com.hour! >= 12)
            {
                ampm = "PM"
            }
            else
            {
                ampm = "AM"
            }
            if(com.minute! < 10)
            {
                dd.timelabel.text = "\(com.year)-\(com.month)-\(com.day)  \(com.hour):0\(com.minute) \(ampm)"
            }
            else
            {
                dd.timelabel.text = "\(com.year)-\(com.month)-\(com.day)  \(com.hour):\(com.minute) \(ampm)"
            }
        }
        else
        {
            dd.timelabel.text = nil
        }
        return dd
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width-30, height: view.frame.height/3)
    }
    func callapi(){
        let ss = "https://newsapi.org/v1/articles?source=bbc-sport&sortBy=top&apiKey=cd9a19968a734d1cb7213cc94fcee0f4"
        let url = URL(string: ss)
        let request = NSMutableURLRequest(url: url!)
          var session = URLSession.shared
        do {
            var task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
                print("Response: \(response)")
                if(error != nil)
                {
                    print(error)
                    return
                }
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: []) as! NSDictionary
                    
                    let jd = json["articles"] as! NSArray
                    
                    for i in jd
                    {
                        let dj = i as! NSDictionary
                        var author:String?
                        if let au = dj["author"] as? NSNull
                        {
                            author = nil
                        }
                        
                        if let au = dj["author"] as? String
                        {
                            author = dj["author"] as? String
                        }
                        
                        
                        
                        let description = dj["description"] as! String
                        let title = dj["title"] as! String
                        let url = dj["url"] as! String
                        var image:String?
                        var urlimage:String?
                        if let au = dj["urlToImage"] as? NSNull
                        {
                            urlimage = nil
                        }
                        
                        if let au = dj["urlToImage"] as? String
                        {
                            urlimage = dj["urlToImage"] as? String
                        }
                        var date:String?
                        if let kb = dj["publishedAt"] as? NSNull
                        {
                            date = nil
                        }
                        
                        if let kb = dj["publishedAt"] as? String
                        {
                            date = dj["publishedAt"] as? String
                        }
                        
                        self.newsarray.append(news(author: author, description: description, title: title,url: url, urlimage: urlimage, date: date))
                        
                    }
                    
                    DispatchQueue.main.async(execute: {
                        self.collectionview.reloadData()
                    })
                    
                    
                }
                catch let error as NSError {
                    print(error)
                }

                
            })
            task.resume()
        }
        catch {
            print("執行NSURLConnection.sendAsynchronousRequest失敗")
            return
        }
        
      
    }
    
}
