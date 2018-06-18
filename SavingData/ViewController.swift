//
//  ViewController.swift
//  SavingData
//
//  Created by mikhey on 13.06.2018.
//  Copyright © 2018 mikhey. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var peopleArray = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
        
        do {
            let people =  try PersistenceServise.context.fetch(fetchRequest)
            self.peopleArray = people
            self.tableView.reloadData()
        } catch  {}
       
        
    }

    @IBAction func onPlus(_ sender: Any) {
        
        let alert = UIAlertController(title:  "Add person" , message: nil, preferredStyle: .alert )
        alert.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Age"
            textField.keyboardType = .numberPad
        }
        
        let action = UIAlertAction(title: "Post", style: .default) { (_) in
            let name = alert.textFields!.first!.text!
            let age = alert.textFields!.last!.text!
            let person =  Person(context: PersistenceServise.context)
            person.name = name
            person.age = Int16(age)!
            PersistenceServise.saveContext()
            self.peopleArray.append(person)
            self.tableView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
}

extension ViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = " \(String(peopleArray[indexPath.row].name!)) (\(String(peopleArray[indexPath.row].age)))"
//        cell.detailTextLabel?.text = "1"
//        print(cell.detailTextLabel?.text ?? "nil")
        return cell
    }
}

