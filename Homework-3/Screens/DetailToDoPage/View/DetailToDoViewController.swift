//
//  DetailToDoViewController.swift
//  Homework-3
//
//  Created by Mehmet Dolasan on 20.09.2022.
//

import UIKit
import CoreData

class DetailToDoViewController: UIViewController {
  
  @IBOutlet weak var contentLabel: UILabel!
  
  var todo: ToDo?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let content = todo?.content {
      contentLabel.text = content
    }
    
  }
  @IBAction func completeTaskButtonTapped(_ sender: Any) {
    
    if let status = todo?.status {
      if !status {
        print("false")
        todo?.status = true
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
      } else {
        print("true")
        todo?.status = false
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
      }
    }
    navigationController?.popToRootViewController(animated: true)
    
  }
}
