//
//  AddTaskViewController.swift
//  GoodList
//
//  Created by Bibi on 2022/12/19.
//

import Foundation
import UIKit
import RxSwift

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
    @IBOutlet weak var taskTitleTextField: UITextField!
    
    @IBAction func save() {
        guard let priority = Priority(rawValue: self.prioritySegmentedControl.selectedSegmentIndex),
              let title = taskTitleTextField.text else {
            return
        }
        
        let task = Task(title: title, priority: priority)
    }
}
