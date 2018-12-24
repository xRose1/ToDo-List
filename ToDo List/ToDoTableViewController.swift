//
//  ToDoTableViewController.swift
//  ToDo List
//
//  Created by Sbedx4 on 10/14/18.
//  Copyright © 2018 Sbedx4. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var ToDoCoreDatas = [ToDo]()
    

    override func viewWillAppear(_ animated: Bool) {
        getToDos()
    }
    
    func getToDos() {
        if let context =  (UIApplication.shared.delegate as?
            AppDelegate)?.persistentContainer.viewContext {
            if let toDosFromCoreData = try?   context.fetch(ToDo.fetchRequest()) {
                if let toDos = toDosFromCoreData as?
                    [ToDo] {
                    ToDoCoreDatas = toDos
                    tableView.reloadData()
                }
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {return ToDoCoreDatas.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let currentToDo = ToDoCoreDatas[indexPath.row]
        
        if currentToDo.important {
            if let name = currentToDo.name {cell.textLabel?.text = "❗️ " + name
        } else {
            cell.textLabel?.text = currentToDo.name
            
        }
        return cell

     }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedToDo = ToDoCoreDatas[indexPath.row]
        performSegue(withIdentifier: "moveTocomplete", sender: selectedToDo)
    }
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let  createVC = segue.destination as?
            CreateToDoViewController{
            createVC.toDoTableVC = self
    }
    
        if let completeVC = segue.destination as?
            CompleteViewController {

            if let selectedToDo = sender as? ToDo {completeVC.todo = selectedToDo}
            
 }

}
        return cell
}

}
