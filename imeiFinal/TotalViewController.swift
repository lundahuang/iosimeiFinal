//
//  TotalViewController.swift
//  imei
//
//  Created by user_02 on 2017/6/23.
//  Copyright © 2017年 user_05. All rights reserved.
//

import UIKit

class TotalViewController: UIViewController {

    var List = [[String:String]]()
    
    
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        
        viewDidLoad()
    }
    
    func getAddItemNoti(noti:Notification) {
        /*let m_paidList = noti.userInfo as? [String:String]
        
        paidList.insert(m_paidList!, at: 0)*/
        
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("food.txt")
        (List as NSArray).write(to: url!, atomically: true)
        
        //tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var total = 0,count = 0
        var tmp = 0,_ = 0,index = 0
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("food.txt")
        let array = NSArray(contentsOf: url!)
        if array != nil {
            List = array as! [[String:String]]
        }
        
        let notiName = Notification.Name("AddItem")
        NotificationCenter.default.addObserver(self, selector: #selector(ItemTableViewController.additemNoti(noti:)), name: notiName, object: nil)
        // Do any additional setup after loading the view.
        for pay in List {
            if Int(pay["price"]!) != nil {
                tmp = Int(pay["price"]!)! * Int(pay["amount"]!)!;
                total += tmp
            }
            count += 1
        }
        if count != 0 {
            totalLabel.text = String(total)
            print(index)
        }
        else{
            totalLabel.text = "0"
        }
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
