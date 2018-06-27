//
//  TaskViewController.swift
//  ToDo
//
//  Created by Michael Zhou on 2018-06-27.
//  Copyright © 2018 Michael Zhou. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {
    var task = Task(name: "", important: false)
    var previousVC = TasksViewController()
    var indexOfTask = 0
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBAction func completeTapped(_ sender: Any) {
        previousVC.tasks.remove(at: indexOfTask)
        previousVC.todoListView.reloadData()
        navigationController!.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if !task.important {
            taskNameLabel.text = task.name
        } else {
            taskNameLabel.text = "👉 \(task.name)"
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
