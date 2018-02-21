//
//  ViewControllerImage.swift
//  Crazy
//
//  Created by usuario on 16/2/18.
//  Copyright © 2018 usuario. All rights reserved.
//

import UIKit

class ViewControllerImage: UITableViewCell {

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var textView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
   override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)    }

}
