//
//  TasksViewController.swift
//  ToDo
//
//  Created by Michael Zhou on 2018-06-26.
//  Copyright © 2018 Michael Zhou. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tasks : [Task] = []
    @IBOutlet weak var todoListView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tasks = makeTasks()
        // Do any additional setup after loading the view, typically from a nib.
        todoListView.dataSource = self
        todoListView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if !task.important {
            cell.textLabel?.text = task.name
        } else {
            cell.textLabel?.text = "👉 \(task.name)"
        }
        return cell
    }
    
    func makeTasks() -> [Task] {
        let task1 = Task(name: "Walk the dog", important: false)
        let task2 = Task(name: "Wash dishes", important: true)
        let task3 = Task(name: "Go to gym", important: false)
        return [task1, task2, task3]
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! NewTaskViewController
        nextVC.previousVC  = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

