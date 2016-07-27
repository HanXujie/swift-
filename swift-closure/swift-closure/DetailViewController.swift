//
//  DetailViewController.swift
//  swift-closure
//
//  Created by HanXujie on 16/7/27.
//  Copyright © 2016年 thinker. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // 改变list界面数据的文本框
    @IBOutlet weak var numTextF: UITextField!
    
    // 拿到数据模型
    var model:Player?
    
    // 定义一个闭包
    var closure:(()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 赋值
        numTextF.text = "\(model?.score ?? 0)"
    }
    

    @IBAction func save(sender: AnyObject) {
        model?.name = numTextF.text
        
        closure?()
        
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
