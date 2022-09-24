//
//  PostModel.swift
//  Homework-3
//
//  Created by Mehmet Dolasan on 20.09.2022.
//

import Foundation

struct PostsCellViewModel {
  var title: String?
  var desc: String?
}

struct Post: Decodable {
  var userId: Int
  var id: Int
  var title: String
  var body: String
}
