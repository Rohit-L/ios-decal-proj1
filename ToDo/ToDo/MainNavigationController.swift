//
//  MainNavigationController.swift
//  ToDo
//
//  Created by Rohit Lalchandani on 10/7/16.
//  Copyright © 2016 Rohit. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pushViewController(ToDoTableViewController(), animated: true)
        
        self.view.backgroundColor = UIColor.white
        self.navigationBar.barTintColor = UIColor(red: CGFloat(104.0 / 255.0), green: CGFloat(237 / 255.0), blue: CGFloat(198 / 255.0), alpha: CGFloat(1))
        //self.navigationBar.barTintColor = UIColor.black
        // Do any additional setup after loading the view.
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
