//
//  ViewController.swift
//  Homework-3
//
//  Created by Mehmet Dolasan on 19.09.2022.
//

import UIKit

class PostsPageViewController: UIViewController {
  //tableView için oluşturulan değişken
  @IBOutlet weak var tableView: UITableView!
  
  //ViewModel katmanına erişmek için oluşturulan instance
  lazy var viewModel = PostsPageViewModel()
  //gelen verilerin tutulacağı dizi
  private var items: [PostsCellViewModel] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //table view işlemleri
    prepareTableView()
    //viewmodel delegesine izin verilmesi
    viewModel.viewDelegate = self
    viewModel.didViewLoad()
  }
  
  private func prepareTableView(){
    tableView.dataSource = self
    //tableView'ı register işlemi
    tableView.register(UINib(nibName: String(describing: PostTableViewCell.self), bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
  }
}

extension PostsPageViewController: PostsPageViewModelViewProtocol {
  //viewModel'dan gelen verilerin view'da gösterilmesi ve tableView in main thread'de güncellenmesi
  func didCellItemFetch(_ items: [PostsCellViewModel]) {
    self.items = items
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
  }
}

extension PostsPageViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //tableView'da kaç adet satır olacağı
    return items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //her satırda gösterilecek verilerin yazılması
    let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as! PostTableViewCell
    cell.postTitleLabel.text = items[indexPath.row].title
    cell.postDescLabel.text = items[indexPath.row].desc
    return cell
  }
  
}




