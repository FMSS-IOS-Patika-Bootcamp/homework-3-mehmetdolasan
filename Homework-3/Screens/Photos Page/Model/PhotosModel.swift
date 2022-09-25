//
//  PhotosModel.swift
//  Homework-3
//
//  Created by Mehmet Dolasan on 23.09.2022.
//

import Foundation

protocol PhotosModelProtocol: AnyObject {
  //verilerin sorunsuz şekilde iletilip iletilmediğinin ele alındığı fonk.
  func didDataFetchProcessFinish(_ isSuccess: Bool)
}

class PhotosModel {
  // ViewModel katmanyla iletişim için oluşturulan delege
  weak var delegate: PhotosModelProtocol?
  //gelen verilerin tutulduğu dizi
  var photos: [Photo] = []
  //verilerin gelmesi için api isteği atılan fonk.
  func fetchData() {
    //kontrollü şekilde url oluşturulması
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
      //hata durumunda verilerin gelmedğinin iletimesi
      delegate?.didDataFetchProcessFinish(false)
      return
    }
    //url isteği için oluşturulan değişken
    var request: URLRequest = .init(url: url)
    request.httpMethod = "GET"
    //isteğin yapıldığı kısım
    let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
      
      guard let self = self else { return }
      
      guard
        error == nil
      else {
        self.delegate?.didDataFetchProcessFinish(false)
        return
      }
      
      let statusCode = (response as! HTTPURLResponse).statusCode
      //status kodlarının ele alınması
      guard
        statusCode >= 200,
        statusCode < 300
      else {
        self.delegate?.didDataFetchProcessFinish(false)
        return
      }
      // data yoksa false olarak geri dönülmesi
      guard let data = data else {
        self.delegate?.didDataFetchProcessFinish(false)
        return
      }
      
      do {
        //verilerin doğru şekilde gelmesi durumunda yapılacaklar
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
