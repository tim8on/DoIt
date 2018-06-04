//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Tim Aton on 6/4/18.
//  Copyright © 2018 Tim Aton. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    var task = Task()
    
    @IBOutlet weak var taskLabel: UILabel!
    
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if task.important {
            taskLabel.text = "❗️\(task.name)"
        } else {
            taskLabel.text = task.name
        }
        
        taskLabel.text = task.name
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        
        //refresh the list
        previousVC.tableView.reloadData()
        
        //go back to task list
        navigationController!.popViewController(animated: true)
    }

}
