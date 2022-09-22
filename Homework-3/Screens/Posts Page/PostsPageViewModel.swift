//
//  PostsPageViewModel.swift
//  Homework-3
//
//  Created by Mehmet Dolasan on 20.09.2022.
//

import Foundation

protocol PostsPageViewModelViewProtocol: AnyObject {
  
  func didCellItemFetch(_ items: [PostsCellViewModel])
  func showEmptyView()
  func hideEmptyView()
}

class PostsPageViewModel {
  
  private let model = PostsPageModel()
  
  weak var viewDelegate: PostsPageViewModelViewProtocol?
  
  init() {
    model.delegate = self
  }
  
  func didViewLoad() {
    model.fetchData()
  }
  
  func didClickItem(at index: Int){
    let selectedItem = model.posts[index]
    // TODO: Navigate
    
  }
}

private extension PostsPageViewModel {
  
  @discardableResult
  func makeViewBasedModel(_ posts: [Post]) -> [PostsCellViewModel] {
    return posts.map{ .init(title: $0.title, desc: $0.body) }
  }
}

extension PostsPageViewModel: PostsPageModelProtocol {
  func didDataFetchProcessFinish(_ isSuccses: Bool) {
    if isSuccses {
      let posts = model.posts
      let cellModels = makeViewBasedModel(posts)
      viewDelegate?.didCellItemFetch(cellModels)
      viewDelegate?.hideEmptyView()
    } else {
      viewDelegate?.showEmptyView()
    }
  }
}
