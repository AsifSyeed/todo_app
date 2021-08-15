//
//  ToDoCell.swift
//  todo_app
//
//  Created by BS-236 on 14/6/21.
//

import UIKit

protocol CheckBoxChange {
    func checkBoxChange(checked: Bool, index: Int)
}

class ToDoCell: UITableViewCell {
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var checkBoxOutline: UIButton!
    
    @IBAction func checkBoxAction(_ sender: Any) {
        if tasks![indexP!].boxChecked {
            delegate?.checkBoxChange(checked: false, index: indexP!)
        } else {
            delegate?.checkBoxChange(checked: true, index: indexP!)
        }
    }
    
    var delegate : CheckBoxChange?
    var indexP : Int?
    var tasks : [Todo]?
    
}
