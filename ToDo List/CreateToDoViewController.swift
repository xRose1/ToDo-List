//
//  CreateToDoViewController.swift
//  ToDo List
//
//  Created by Sbedx4 on 10/17/18.
//  Copyright © 2018 Sbedx4. All rights reserved.
//

import UIKit

class CreateToDoViewController: UIViewController {

    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var importantSwitch: UITextField!
    
    var toDoTableVC: ToDoTableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func addTapped(_ sender: Any) {
       if let context =  (UIApplication.shared.delegate as?
        AppDelegate)?.persistentContainer.viewContext {
        let newToDo = ToDo(context: context)
        newToDo.important = importantSwitch.isEnabled
        if let name = nameTextfield.text {
            newToDo.name = name
        }
        (UIApplication.shared.delegate as?
            AppDelegate)?.saveContext()
        }

        navigationController?.popViewController(animated: true)
    }
    
}
