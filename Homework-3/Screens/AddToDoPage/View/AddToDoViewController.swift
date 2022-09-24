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
    
    //deleteAll(entity: "ToDo")
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
  
//  func deleteAll(entity: String) {
//    let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
//    let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
//    do {
//      try AppDelegate.sharedAppDelegate.coreDataStack.managedContext.execute(deleteRequest)
//      try AppDelegate.sharedAppDelegate.coreDataStack.managedContext.save()
//    } catch  {
//      print("There was an error")
//    }
//  }
}
