//
//  ToDoViewController.swift
//  Homework-3
//
//  Created by Mehmet Dolasan on 19.09.2022.
//

import UIKit

class ToDoViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  lazy var viewModel = ToDoViewModel()
  private var todos: [ToDo] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    prepareTableView()
    viewModel.viewDelegate = self
    viewModel.didViewLoad()
    
  }
  override func viewWillAppear(_ animated: Bool) {
    viewModel.didViewLoad()
    self.tableView.reloadData()
  }
  
  
  
  private func prepareTableView(){
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UINib(nibName: String(describing: ToDoTableViewCell.self), bundle: nil), forCellReuseIdentifier: "ToDoTableViewCell")
  }
}

extension ToDoViewController: ToDoViewModelViewProtocol {
  func didCellItemFetch(_ items: [ToDo]) {
    self.todos = items
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
  }
}

extension ToDoViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return todos.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell") as! ToDoTableViewCell
    
    cell.contentLabel.text = todos[indexPath.row].content
    if todos[indexPath.row].status == true {
      cell.statusImage.image = UIImage(systemName: "checkmark.seal.fill")
    } else {
      cell.statusImage.image = UIImage(systemName: "checkmark.seal")
    }
    return cell
  }
}

extension ToDoViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let destVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailToDoViewController") as! DetailToDoViewController
    
    destVC.todo = todos[indexPath.row]
    navigationController?.pushViewController(destVC, animated: true)
  }
}
