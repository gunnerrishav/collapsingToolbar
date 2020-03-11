//
//  ContentTableViewCell.swift
//  collapsingToolbar
//
//  Created by Rishab Maharjan on 2/12/20.
//  Copyright © 2020 Rishab. All rights reserved.
//

import UIKit

class ContentTableViewCell: UITableViewCell {
    @IBOutlet weak var lblContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
