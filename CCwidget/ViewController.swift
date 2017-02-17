//
//  ViewController.swift
//  CCwidget
//
//  Created by cwp on 2017/2/15.
//  Copyright © 2017年 cwp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidAppear(_ animated: Bool) {
        
        setinitNotsdw()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "widget"
        view.backgroundColor = UIColor.white
        
        
        let btnview = UIView()
        btnview.frame = CGRect(x: (UIScreen.main.bounds.width - 100) / 2, y: (UIScreen.main.bounds.height - 100) / 2, width: 100, height: 100)
        self.view.addSubview(btnview)
        
        let btnarr = ["空调控制","车门控制","车锁控制"]
        
        for i in 0 ..< 3  {
            
            let btn = UIButton(type: .system)
            let btn_Y = i * 40
            btn.tag = 101 + i
            btn.frame = CGRect(x: 0, y: CGFloat(btn_Y), width: 100, height: 20)
            btn.setTitle(btnarr[i], for: .normal)
            btn.setTitleColor(.black, for: .normal)
            btn.addTarget(self, action: #selector(btnAction(btn:)), for: .touchUpInside)
            
            btnview.addSubview(btn)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(setinitNotsdw), name: NSNotification.Name(rawValue: "tongzhicwp"), object: nil)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func btnAction(btn:UIButton){
        
        if btn.tag == 101 {
            
            let aaview = AAViewController()
            self.navigationController?.pushViewController(aaview, animated: true)
            
        }else if btn.tag == 102 {
            
            let bbview = BBViewController()
            self.navigationController?.pushViewController(bbview, animated: true)
            
        }else if btn.tag == 103 {
            
            let ccview = CCViewController()
            self.navigationController?.pushViewController(ccview, animated: true)
            
        }
        
        
        
        
    }
    
    
    func setinitNotsdw(){
        
        let tempStr = UserDefaults(suiteName: "group.ccwidget.test")
        let value = tempStr?.object(forKey: "chemenkongzhi") as? String
        
        if(value == "空调控制"){
            
            let aaview = AAViewController()
            self.navigationController?.pushViewController(aaview, animated: true)
            
            
        }else if(value == "车门控制"){
            
            let bbview = BBViewController()
            self.navigationController?.pushViewController(bbview, animated: true)
            
        }else if(value == "车锁控制"){
            
            let ccview = CCViewController()
            self.navigationController?.pushViewController(ccview, animated: true)
            
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

