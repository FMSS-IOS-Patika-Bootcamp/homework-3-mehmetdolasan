//
//  PostsPageModel.swift
//  Homework-3
//
//  Created by Mehmet Dolasan on 22.09.2022.
//

import Foundation

protocol PostsPageModelProtocol: AnyObject {
  //verilerin sorunsuz şekilde iletilip iletilmediğinin ele alındığı fonk.
  func didDataFetchProcessFinish(_ isSuccses: Bool)
}

class PostsPageModel {
  // ViewModel katmanyla iletişim için oluşturulan delege
  weak var delegate: PostsPageModelProtocol?
  //gelen verilerin tutulduğu dizi
  var posts: [Post] = []
  //verilerin gelmesi için api isteği atılan fonk.
  func fetchData() {
    //kontrollü şekilde url oluşturulması
    guard let url =  URL(string: "https://jsonplaceholder.typicode.com/posts") else {
      //hata durumunda verilerin gelmedğinin iletimesi
      delegate?.didDataFetchProcessFinish(false)
      return
    }
    //url isteği için oluşturulan değişken
    var request: URLRequest = .init(url: url)
    //get isteğinin yapıldığı değişkene yazılır.
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
        self.posts = try jsonDecoder.decode([Post].self, from: data)
        self.delegate?.didDataFetchProcessFinish(true)
      } catch {
        self.delegate?.didDataFetchProcessFinish(false)
      }
    }
    task.resume()
  }
}
