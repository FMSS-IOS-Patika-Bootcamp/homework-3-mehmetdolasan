//
//  PhotosViewController.swift
//  Homework-3
//
//  Created by Mehmet Dolasan on 19.09.2022.
//

import UIKit

class PhotosViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    prepareCollectionView()
  }
  private func prepareCollectionView(){
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(UINib(nibName: String(describing: PhotoCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: "PhotoCollectionViewCell")
  }
}
extension PhotosViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath)
    
    return cell
  }
  
}
extension PhotosViewController: UICollectionViewDelegate {
  
}
