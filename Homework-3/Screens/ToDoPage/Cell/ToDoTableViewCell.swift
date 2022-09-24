//
//  ToDoTableViewCell.swift
//  Homework-3
//
//  Created by Mehmet Dolasan on 20.09.2022.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
  
  @IBOutlet weak var contentLabel: UILabel!
  @IBOutlet weak var statusImage: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
}
