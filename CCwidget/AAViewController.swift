//
//  AAViewController.swift
//  CCwidget
//
//  Created by cwp on 2017/2/16.
//  Copyright © 2017年 cwp. All rights reserved.
//

import UIKit

class AAViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        
        let tempStr = UserDefaults(suiteName: "group.ccwidget.test")
        tempStr?.set(nil, forKey: "chemenkongzhi")
        tempStr?.synchronize()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "空调控制"
        self.view.backgroundColor = UIColor.white
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(backAction))
        
        // Do any additional setup after loading the view.
    }

    func backAction(){
        
        self.navigationController?.popViewController(animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
