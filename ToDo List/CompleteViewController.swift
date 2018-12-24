//
//  CompleteViewController.swift
//  ToDo List
//
//  Created by Sbedx4 on 10/18/18.
//  Copyright © 2018 Sbedx4. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    var todo: ToDo? = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let toDo = todo {
        if toDo.important {
            if let name = toDo.name {
                nameLabel.text = "❗️ " + name
            } else {
                nameLabel.text = toDo.name
            }
            }
    }
    
    }
    @IBAction func completeTapped(_ sender: Any) {
        if let context =  (UIApplication.shared.delegate as?
            AppDelegate)?.persistentContainer.viewContext {
            if let ToDo = ToDo{
                context.delete(ToDo)
            }
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            
        }
        navigationController?.popViewController(animated: true)
    }


}
