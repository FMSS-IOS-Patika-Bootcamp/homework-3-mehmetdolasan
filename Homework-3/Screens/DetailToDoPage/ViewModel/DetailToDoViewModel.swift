//
//  DetailToDoViewModel.swift
//  Homework-3
//
//  Created by Mehmet Dolasan on 24.09.2022.
//

import Foundation

protocol DetailToDoViewModelViewProtocol: AnyObject {
  
  func didCellItemFetch(_ items: ToDo)
}

class DetailToDoViewModel {
  
  private let model = DetailToDoModel()
  
  weak var viewDelegate: DetailToDoViewModelViewProtocol?
  
  init() {
    model.delegate = self
  }
  
  func didViewLoad() {
    model.fetchData()
  }
}

extension DetailToDoViewModel: DetailToDoModelProtocol {
  func didFetchProcessFinish(_ isSuccess: Bool) {
    if isSuccess {
      if let todo = model.todo {
        viewDelegate?.didCellItemFetch(todo)
      }
    }
  }
}
