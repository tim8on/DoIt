//
//  ViewController.swift
//  DoIt
//
//  Created by Tim Aton on 6/4/18.
//  Copyright © 2018 Tim Aton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    //make a variable that holds all the tasks to display
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //this function makes the tasks from below
        tasks = makeTasks()
        
        //this needs to be last - it'll load whatever it finds at the time
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        //add an "!" if it's important
        if task.important {
            cell.textLabel!.text = "❗️\(task.name)"
        } else {
            cell.textLabel!.text = task.name
        }
        
        return cell
    }
    
    //function that makes tasks
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Walk the dog"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Buy cheese"
        task2.important = true
        
        let task3 = Task()
        task3.name = "Mow the lawn"
        task3.important = false
        
        return [task1, task2, task3]
    }
    
    //add the plus button from UI
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegua", sender: nil)
    }
    
}

