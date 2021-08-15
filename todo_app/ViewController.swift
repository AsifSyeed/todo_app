//
//  ViewController.swift
//  todo_app
//
//  Created by BS-236 on 14/6/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddTask, CheckBoxChange {
    func checkBoxChange(checked: Bool, index: Int) {
        tasks[index].boxChecked = checked
        tableView.reloadData()
    }
    
    
    
    func addTask(name: String) {
        tasks.append(Todo(name: name))
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddTaskController
        vc.delegate = self
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Todo] = []

    override func viewDidLoad() {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "todolist", for: indexPath) as! ToDoCell
                
        cell.taskLabel.text = tasks[indexPath.row].taskName
        
        if tasks[indexPath.row].boxChecked {
            cell.checkBoxOutline.setBackgroundImage(#imageLiteral(resourceName: "checkBoxFILLED "), for: UIControl.State.normal)
        } else {
            cell.checkBoxOutline.setBackgroundImage(#imageLiteral(resourceName: "checkBoxOUTLINE "), for: UIControl.State.normal)
        }
        
        cell.delegate = self
        cell.indexP = indexPath.row
        cell.tasks = tasks
        
        
        return cell
    }

}


class Todo {
    var taskName = ""
    var boxChecked = false
    
    convenience init (name: String) {
        self.init()
        self.taskName = name
    }
}
