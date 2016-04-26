//
//  ClientNameTableViewCell.swift
//  EKVoiceText
//
//  Created by Karthik on 4/19/16.
//  Copyright © 2016 KarthikThota. All rights reserved.
//

import UIKit

class ClientNameTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var claimNoLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
