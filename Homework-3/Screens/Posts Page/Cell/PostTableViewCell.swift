//
//  PostTableViewCell.swift
//  Homework-3
//
//  Created by Mehmet Dolasan on 20.09.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
  
  
  @IBOutlet private weak var containerView: UIView!
  @IBOutlet private(set) weak var postTitleLabel: UILabel!
  @IBOutlet private(set) weak var postDescLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    containerView.backgroundColor = .lightGray.withAlphaComponent(0.3)
    containerView.layer.cornerRadius = 8
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    
  }
}
