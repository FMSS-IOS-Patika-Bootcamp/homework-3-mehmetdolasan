//
//  PhotosModel.swift
//  Homework-3
//
//  Created by Mehmet Dolasan on 23.09.2022.
//

import Foundation

protocol PhotosModelProtocol: AnyObject {
  
  func didDataFetchProcessFinish(_ isSuccess: Bool)
}

class PhotosModel {
  
  weak var delegate: PhotosModelProtocol?

  var photos: [Photo] = []
  
  func fetchData() {
    
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
      delegate?.didDataFetchProcessFinish(false)
      return
    }
    var request: URLRequest = .init(url: url)
    request.httpMethod = "GET"
    
    let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
      
      guard let self = self else { return }
      
      guard
        error == nil
      else {
        self.delegate?.didDataFetchProcessFinish(false)
        return
      }
      
      let statusCode = (response as! HTTPURLResponse).statusCode
      
      guard
        statusCode >= 200,
        statusCode < 300
      else {
        self.delegate?.didDataFetchProcessFinish(false)
        return
      }
      
      guard let data = data else {
        self.delegate?.didDataFetchProcessFinish(false)
        return
      }
      
      do {
        let jsonDecoder = JSONDecoder()
        self.photos = try jsonDecoder.decode([Photo].self, from: data)
        self.delegate?.didDataFetchProcessFinish(true)
      } catch {
        self.delegate?.didDataFetchProcessFinish(false)
      }
    }
    task.resume()
  }
}
