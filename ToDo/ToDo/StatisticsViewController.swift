//
//  StatisticsViewController.swift
//  ToDo
//
//  Created by Rohit Lalchandani on 10/15/16.
//  Copyright © 2016 Rohit. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    var text: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(self.text)
        self.text.translatesAutoresizingMaskIntoConstraints = false
        self.text.topAnchor.constraint(greaterThanOrEqualTo: self.view.topAnchor, constant: CGFloat(100.0)).isActive = true
        self.text.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.text.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.text.widthAnchor.constraint(equalToConstant: CGFloat(300)).isActive = true
        self.text.textAlignment = .center
        self.text.lineBreakMode = .byWordWrapping
        self.text.numberOfLines = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

