//
//  AddTaskController.swift
//  todo_app
//
//  Created by BS-236 on 14/6/21.
//

import UIKit

protocol AddTask {
    func addTask(name : String)
}


class AddTaskController: UIViewController {

    
    @IBAction func addAction(_ sender: Any) {
        
        if textInput.text != "" {
            delegate?.addTask(name: textInput.text!)
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    @IBOutlet weak var textInput: UITextField!
    
    var delegate : AddTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
