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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        //create a task from the outlet's info
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task = Task(context: context)
        
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        
        //save to CoreData
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //go back to task list
        navigationController!.popViewController(animated: true)
    }

}
