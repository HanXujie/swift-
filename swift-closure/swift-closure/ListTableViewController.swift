//
//  ListTableViewController.swift
//  swift-closure
//
//  Created by HanXujie on 16/7/27.
//  Copyright © 2016年 thinker. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {

    var list:[Player]?
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData { (players) -> () in
            self.list = players
            // 刷新数据
            self.tableView.reloadData()
        }
    }
    
    // 数据顺传
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let dtVC = segue.destinationViewController as! DetailViewController
        
        let indexPath = tableView.indexPathForSelectedRow
        
        guard let idx = indexPath else{
            
            return
        }
        
        let model = list![idx.row]
        
        dtVC.model = model
        
        let homeClosure = {
            
            self.tableView.reloadData()
        }
        
        dtVC.closure = homeClosure
        
    }
    
    
    // 网络请求加载数据--模拟
    func loadData(finished: (players: [Player])->()){
        
        // GCD异步加载数据
        dispatch_async(dispatch_get_global_queue(0, 0)) { () -> Void in
            
            // 睡眠两秒钟
            NSThread.sleepForTimeInterval(2)
            
            // 初始化一个数组
            var array: [Player] = [Player]()
            
            // 拼接数据
            for i in 0...50{
                // 名字
                let name = "NO.\(i)"
                // 分数
                let score = random()%100
                
                let dict: [String : AnyObject] = ["name":name,"score":score]
                
                // 字典转模型
                let p = Player(dict: dict)
                
                array.append(p)
                
            }
            
            // 回到主线程回调
            dispatch_sync(dispatch_get_main_queue(), { () -> Void in
                
                finished(players: array)
            })
            
            
            
            
        }
        
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list?.count ?? 0
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as!PlayerTableViewCell
        
        cell.model = list![indexPath.row]

        return cell
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 100.0
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
