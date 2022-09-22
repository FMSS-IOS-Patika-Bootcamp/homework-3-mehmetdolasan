//
//  ViewController.swift
//  Homework-3
//
//  Created by Mehmet Dolasan on 19.09.2022.
//

import UIKit

class PostsPageViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  lazy var viewModel = PostsPageViewModel()
  private var items: [PostsCellViewModel] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    prepareTableView()
    viewModel.viewDelegate = self
    viewModel.didViewLoad()
  }
  
  private func prepareTableView(){
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(UINib(nibName: String(describing: PostTableViewCell.self), bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
  }
  
}

extension PostsPageViewController: PostsPageViewModelViewProtocol {
  
  func didCellItemFetch(_ items: [PostsCellViewModel]) {
    self.items = items
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
  }
  
  func showEmptyView() {
    // TODO:
  }
  
  func hideEmptyView() {
    // TODO:
  }
  
}

extension PostsPageViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    viewModel.didClickItem(at: indexPath.row)
  }
}

extension PostsPageViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as! PostTableViewCell
    cell.postTitleLabel.text = items[indexPath.row].title
    cell.postDescLabel.text = items[indexPath.row].desc
    return cell
  }
  
}




