//
//  ToDoViewController.swift
//  Homework-3
//
//  Created by Mehmet Dolasan on 19.09.2022.
//

import UIKit

class ToDoViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    prepareTableView()
  }
  
  private func prepareTableView(){
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UINib(nibName: String(describing: ToDoTableViewCell.self), bundle: nil), forCellReuseIdentifier: "ToDoTableViewCell")
  }
}

extension ToDoViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    
    return cell
  }
}

extension ToDoViewController: UITableViewDelegate {
  
}
