//
//  AddToDoViewController.swift
//  Homework-3
//
//  Created by Mehmet Dolasan on 20.09.2022.
//

import UIKit
import CoreData

class AddToDoViewController: UIViewController {
  
  @IBOutlet weak var contentTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  @IBAction func addTaskButtonTapped(_ sender: Any) {
    
    let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
    let data = ToDo(context: managedContext)
  
    if let content = contentTextField.text {
      data.setValue(content, forKey: #keyPath(ToDo.content))
      data.setValue(false, forKey: #keyPath(ToDo.status))
    }
    AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
    navigationController?.popToRootViewController(animated: true)
  }
}
