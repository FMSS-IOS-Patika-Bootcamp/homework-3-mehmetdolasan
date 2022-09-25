//
//  PostsPageViewModel.swift
//  Homework-3
//
//  Created by Mehmet Dolasan on 20.09.2022.
//

import Foundation

protocol PostsPageViewModelViewProtocol: AnyObject {
  //Cell için oluşturulan her item ın iletildiği fonk.
  func didCellItemFetch(_ items: [PostsCellViewModel])
}

class PostsPageViewModel {
  //Model katmanına erişmek için oluşturulan instance
  private let model = PostsPageModel()
  //view ile iletişim için oluşturulan delege
  weak var viewDelegate: PostsPageViewModelViewProtocol?
  
  init() {
    //bu sınıftan bir nesne üretildiğinde model katmanındaki delegate' in kullanılabilmesi için self ataması yapıldı.
    model.delegate = self
  }
  
  func didViewLoad() {
    //view yüklendiğinde veri çekilmesi
    model.fetchData()
  }
}

private extension PostsPageViewModel {
  //verilerin oluşturduğumuz entity formunda olabilmesi için yapılan transform işlemi, discardableResult anatasyonu return edilen değerin bazı durumlarda önemsenmeyeceği anlamı taşıyor.
  @discardableResult
  func makeViewBasedModel(_ posts: [Post]) -> [PostsCellViewModel] {
    return posts.map{ .init(title: $0.title, desc: $0.body) }
  }
}

extension PostsPageViewModel: PostsPageModelProtocol {
  //gelen verilerin kontrollü şekilde ve transform edilmiş şekilde view katmanına iletilmesi 
  func didDataFetchProcessFinish(_ isSuccses: Bool) {
    if isSuccses {
      let posts = model.posts
      let cellModels = makeViewBasedModel(posts)
      viewDelegate?.didCellItemFetch(cellModels)
    }
  }
}
