//
//  ViewController.swift
//  ToDo
//
//  Created by Michael Zhou on 2018-06-26.
//  Copyright © 2018 Michael Zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

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
        let task1 = Task()
        task1.name = "Walk the dog"
        task1.important = false
        let task2 = Task()
        task2.name = "Wash dishes"
        task2.important = true
        let task3 = Task()
        task3.name = "Go to gym"
        task3.important = true
        return [task1, task2, task3]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

