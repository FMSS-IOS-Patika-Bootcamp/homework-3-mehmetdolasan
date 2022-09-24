//
//  PhotosEntity.swift
//  Homework-3
//
//  Created by Mehmet Dolasan on 23.09.2022.
//

import Foundation

struct PhotosCellViewModel {
  var imageUrl: String?
}

struct Photo: Decodable {
  var albumId: Int
  var id: Int
  var title: String
  var url: String
  var thumbnailUrl: String
}
