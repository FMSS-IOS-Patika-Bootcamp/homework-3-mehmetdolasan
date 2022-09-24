//
//  ToDoViewModel.swift
//  Homework-3
//
//  Created by Mehmet Dolasan on 24.09.2022.
//

import Foundation

protocol ToDoViewModelViewProtocol: AnyObject {
  
  func didCellItemFetch(_ items: [ToDo])
}

class ToDoViewModel {
  
  private let model = ToDoModel()
  
  weak var viewDelegate: ToDoViewModelViewProtocol?
  
  init() {
    model.delegate = self
  }
  
  func didViewLoad() {
    model.fetchData()
  }
  
}

extension ToDoViewModel: ToDoModelProtocol {
  func didDataFetchProcessFinish(_ isSuccess: Bool) {
    if isSuccess {
      let todos = model.toDos
      viewDelegate?.didCellItemFetch(todos)
    }
  }
}
