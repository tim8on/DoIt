//
//  TasksViewController.swift
//  DoIt
//
//  Created by Tim Aton on 6/4/18.
//  Copyright © 2018 Tim Aton. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    //make a variable that holds all the tasks to display
    var tasks : [Task] = []
    
    //just the first time
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //this needs to be last - it'll load whatever it finds at the time
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //when the screen is about to show
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        //add an "!" if it's important
        if task.important {
            cell.textLabel!.text = "❗️\(task.name!)"
        } else {
            cell.textLabel!.text = task.name!
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    //add the plus button from UI
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    //get the tasks from CoreData
    func getTasks() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
        } catch {
            print("ERROR WITH FETCH")
        }
        
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            //if select button is initiated
            if segue.identifier == "selectTaskSegue" {
                let nextVC = segue.destination as! CompleteTaskViewController
                nextVC.task = sender as? Task
            }
        }
        
    }
}
