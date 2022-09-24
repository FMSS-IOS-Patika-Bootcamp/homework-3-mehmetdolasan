//
//  PostsPageViewModel.swift
//  Homework-3
//
//  Created by Mehmet Dolasan on 20.09.2022.
//

import Foundation

protocol PostsPageViewModelViewProtocol: AnyObject {
  
  func didCellItemFetch(_ items: [PostsCellViewModel])
}

class PostsPageViewModel {
  
  private let model = PostsPageModel()  // model = PostListModel()
  
  weak var viewDelegate: PostsPageViewModelViewProtocol?
  
  init() {
    model.delegate = self
  }
  
  func didViewLoad() {
    model.fetchData()
  }
  
//  func numberOfItems() -> Int {
//    //sayı değişikliği burda yapılacak
//    return model.posts.count
//  }
//
//  func numberOfSections() -> Int {
//    return 1
//  }
//  func getModel(at index: Int) -> PostsCellViewModel {
//    return transformPostToCellModel(model.posts[index])
//  }
//  func transformPostToCellModel(_ post: Post) -> PostsCellViewModel {
//    return .init(title: post.title, desc: post.body)
//  }
}

//burası silinecek
private extension PostsPageViewModel {
  
  @discardableResult
  func makeViewBasedModel(_ posts: [Post]) -> [PostsCellViewModel] {
    return posts.map{ .init(title: $0.title, desc: $0.body) }
  }
}
//
extension PostsPageViewModel: PostsPageModelProtocol {
  func didDataFetchProcessFinish(_ isSuccses: Bool) {
    if isSuccses {
      let posts = model.posts
      let cellModels = makeViewBasedModel(posts)
      viewDelegate?.didCellItemFetch(cellModels)
    }
  }
}
