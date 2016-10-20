//
//  ToDoTableViewController.swift
//  ToDo
//
//  Created by Rohit Lalchandani on 10/10/16.
//  Copyright © 2016 Rohit. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var todos: [String] = []
    var checks: [Bool] = []
    var times: [Date] = []
    
    func addButtonPressed(sender: UIBarButtonItem) {
        self.navigationController?.pushViewController(AddToDoViewController(), animated: true)
    }
    
    func statsButtonPressed(sender: UIBarButtonItem) {
        let newVC = StatisticsViewController()
        
        var total = 0
        for i in 0..<(self.todos.count) {
            if self.checks[i] {
                if (Int(Date().timeIntervalSince(self.times[i])) / 3600) < 24 {
                    total += 1
                }
            }
        }
        
        newVC.text.text = String(total) + " Tasks Completed in the Last 24 Hours"
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
    func refresh() {

        var itemsToRemove: [Int] = []
        for i in 0..<(self.todos.count) {
            print(i)
            print(self.checks)
            if self.checks[i] {
                if (Int(Date().timeIntervalSince(self.times[i])) / 3600) >= 24 {
                    itemsToRemove.append(i)
                }
            }
        }
        
        self.todos = self.todos
            .enumerated()
            .filter { !itemsToRemove.contains($0.offset) }
            .map { $0.element }
        
        self.checks = self.checks
            .enumerated()
            .filter { !itemsToRemove.contains($0.offset) }
            .map { $0.element }
        
        self.times = self.times
            .enumerated()
            .filter { !itemsToRemove.contains($0.offset) }
            .map { $0.element }
        
        var indexPaths: [IndexPath] = []
        for row in itemsToRemove {
            indexPaths.append(IndexPath.init(row: row, section: 0))
        }
        tableView.deleteRows(at: indexPaths, with: .fade)
    }
    
    func addItem(_ item: String) {
        self.todos.append(item)
        self.checks.append(false)
        self.times.append(Date())
        self.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ToDoCell")
        self.navigationItem.title = "ToDo List"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Add", style: .plain, target: self, action: #selector(ToDoTableViewController.addButtonPressed(sender:)))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "Stats", style: .plain, target: self, action: #selector(ToDoTableViewController.statsButtonPressed(sender:)))
        
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector("refresh"), userInfo: nil, repeats: true)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.todos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)

        if (cell == nil) {
            cell = UITableViewCell(style: .value1, reuseIdentifier: "ToDoCell")
        }
        
        cell?.textLabel?.text = self.todos[indexPath.row]
        if self.checks[indexPath.row] {
            cell?.accessoryType = .checkmark
        } else {
            cell?.accessoryType = .none
        }

        return cell!
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.todos.remove(at: indexPath.row)
            self.checks.remove(at: indexPath.row)
            self.times.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    override func tableView(_ tableView: UITableView, didSelectRowAt: IndexPath) {
        let cell = tableView.cellForRow(at: didSelectRowAt)
        if cell?.accessoryType == UITableViewCellAccessoryType.none {
            cell?.accessoryType = .checkmark
            self.checks[didSelectRowAt.row] = true
            self.times[didSelectRowAt.row] = Date()
        } else {
            cell?.accessoryType = .none
            self.checks[didSelectRowAt.row] = false
        }
        tableView.deselectRow(at: didSelectRowAt, animated: true)
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
