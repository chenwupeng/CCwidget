//
//  TodayViewController.swift
//  swiftWidget
//
//  Created by cwp on 2017/2/15.
//  Copyright © 2017年 cwp. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var widgetLeft: NSLayoutConstraint!
    
    
    @IBOutlet weak var lockimg: UIButton!
    
    @IBOutlet weak var cardoorimg: UIButton!
    
    @IBOutlet weak var kongtiaoimg: UIButton!
    
    @IBOutlet weak var dcimg: UIImageView!
    
    @IBOutlet weak var labelnum: UILabel!
    
    @IBOutlet weak var chargeTime: UILabel!
    @IBAction func lockAction(_ sender: Any) {
        
        //通过extensionContext借助host app调起app
        self.extensionContext?.open(NSURL(string:"widgetcc://") as! URL, completionHandler: { (bool) in
            
            
            let shared = UserDefaults(suiteName: "group.ccwidget.test")
            shared?.set("车锁控制", forKey: "chemenkongzhi")
            shared?.synchronize()
            
        })
        
    }
    
    @IBAction func btnadcAction(_ sender: Any) {
        
        //通过extensionContext借助host app调起app
        self.extensionContext?.open(NSURL(string:"widgetcc://") as! URL, completionHandler: { (bool) in
            
            
            let shared = UserDefaults(suiteName: "group.ccwidget.test")
            shared?.set("车门控制", forKey: "chemenkongzhi")
            shared?.synchronize()
            
        })
        
        
    }
    
    @IBAction func kongtiaoAction(_ sender: Any) {
        
        //通过extensionContext借助host app调起app
        self.extensionContext?.open(NSURL(string:"widgetcc://") as! URL, completionHandler: { (bool) in
            
            
            let shared = UserDefaults(suiteName: "group.ccwidget.test")
            shared?.set("空调控制", forKey: "chemenkongzhi")
            shared?.synchronize()
            
        })
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if (UIScreen.main.bounds.width != 320){
            widgetLeft.constant = 30
        }else{
            
            widgetLeft.constant = 15
        }
        
        
        if #available(iOS 10.0, *){
            
            labelnum.textColor = .black
            chargeTime.textColor = .black
            lockimg.setImage(UIImage(named:"icon_cmkz"), for: .normal)
            cardoorimg.setImage(UIImage(named:"icon_cckz"), for: .normal)
            kongtiaoimg.setImage(UIImage(named:"icon_yykt_1"), for: .normal)
            dcimg.image = UIImage(named: "icon_dc")
            
        }else{
            
            labelnum.textColor = UIColor.white
            chargeTime.textColor = UIColor.white
            lockimg.setImage(UIImage(named:"icon_cmkzcwp"), for: .normal)
            cardoorimg.setImage(UIImage(named:"icon_cckzcwp"), for: .normal)
            kongtiaoimg.setImage(UIImage(named:"icon_yykt_1cwp"), for: .normal)
            dcimg.image = UIImage(named: "icon_dccwp")
        }
        
        
        
        
        // Do any additional setup after loading the view from its nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
    func widgetMarginInsets(forProposedMarginInsets defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}
