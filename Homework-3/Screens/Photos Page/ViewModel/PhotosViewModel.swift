//
//  PhotosViewModel.swift
//  Homework-3
//
//  Created by Mehmet Dolasan on 23.09.2022.
//

import Foundation

protocol PhotosViewModelViewProtocol: AnyObject {
  
  func didCellItemFetch(_ photos: [PhotosCellViewModel])
}

class PhotosViewModel {
  
  private let model = PhotosModel()
  
  weak var viewDelegate: PhotosViewModelViewProtocol?
  
  init() {
    model.delegate = self
  }
  
  func didViewLoad() {
    model.fetchData()
  }
}

private extension PhotosViewModel {
  
  func makeViewBasedModel(_ photos: [Photo]) -> [PhotosCellViewModel] {
    return photos.map{ .init(imageUrl: $0.url)}
  }
}

extension PhotosViewModel: PhotosModelProtocol {
  func didDataFetchProcessFinish(_ isSuccess: Bool) {
    if isSuccess {
      let photos = model.photos
      let cellModels = makeViewBasedModel(photos)
      viewDelegate?.didCellItemFetch(cellModels)
    }
  }
}
