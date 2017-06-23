//
//  ItemDetailViewController.swift
//  imei
//
//  Created by user_02 on 2017/6/23.
//  Copyright © 2017年 user_05. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {

    var itemInfoDic:[String:String]!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var otherTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        nameLabel.text = itemInfoDic["name"]!
        priceLabel.text = itemInfoDic["price"]!
        amountLabel.text = itemInfoDic["amount"]!
        otherTextView.text = itemInfoDic["other"]!
        
        self.navigationItem.title = itemInfoDic["name"]!
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
