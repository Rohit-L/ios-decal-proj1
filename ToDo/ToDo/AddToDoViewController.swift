//
//  AddToDoViewController.swift
//  ToDo
//
//  Created by Rohit Lalchandani on 10/6/16.
//  Copyright © 2016 Rohit. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    var text: UITextField = UITextField()
    
    func doneButtonPressed(sender: UIBarButtonItem) {
        let numViewControllers = self.navigationController?.viewControllers.count
        let tableController = self.navigationController?.viewControllers[numViewControllers! - 2] as! ToDoTableViewController
        if (self.text.text! != "") {
            tableController.addItem(self.text.text!)
            self.navigationController?.popViewController(animated: true)
        } else {
            let alert = UIAlertController(title: "Blank ToDo", message: "You must enter a ToDo item.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view, typically from a nib.
        self.text.placeholder = "Enter ToDo Item"
        self.text.borderStyle = UITextBorderStyle.roundedRect
        self.view.addSubview(self.text)
        self.text.translatesAutoresizingMaskIntoConstraints = false
        self.text.topAnchor.constraint(greaterThanOrEqualTo: self.view.topAnchor, constant: CGFloat(100.0)).isActive = true
        self.text.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.text.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.text.widthAnchor.constraint(equalToConstant: CGFloat(300)).isActive = true
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(AddToDoViewController.doneButtonPressed(sender:)))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

