//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Tim Aton on 6/4/18.
//  Copyright © 2018 Tim Aton. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        //create a task from the outlet's info
        let task = Task()
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        
        //add task to array in main view controller
        previousVC.tasks.append(task)
    }

}
