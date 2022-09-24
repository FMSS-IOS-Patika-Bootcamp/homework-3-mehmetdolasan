//
//  PhotosViewController.swift
//  Homework-3
//
//  Created by Mehmet Dolasan on 19.09.2022.
//

import UIKit
import Kingfisher

class PhotosViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  lazy var viewModel = PhotosViewModel()
  private var photos: [PhotosCellViewModel] = []
  private var tempPhotos: [PhotosCellViewModel] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    prepareCollectionView()
    viewModel.viewDelegate = self
    viewModel.didViewLoad()

  }
  private func prepareCollectionView(){
    collectionView.dataSource = self
    collectionView.register(UINib(nibName: String(describing: PhotoCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: "PhotoCollectionViewCell")
  }
}


extension PhotosViewController: PhotosViewModelViewProtocol {
  
  func didCellItemFetch(_ photos: [PhotosCellViewModel]) {
    self.photos = photos
    self.tempPhotos = [PhotosCellViewModel]()
    var i = 0
    while i < 30 {
      tempPhotos.append(photos[i])
      i = i + 1
    }
    
    DispatchQueue.main.async {
      self.collectionView.reloadData()
    }
  }
}

extension PhotosViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return tempPhotos.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
    
    if let urlString = tempPhotos[indexPath.row].imageUrl {
      if let imageUrl = URL(string: urlString ) {
        cell.imageView.kf.setImage(with: imageUrl)
      }
    }
    return cell
  }
  
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    .init(width: (collectionView.frame.width - 32)/3 , height: (collectionView.frame.height)/3)
  }
}

