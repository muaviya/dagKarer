//
//  TableViewCell.swift
//  FBTestApp2
//
//  Created by Muaviya on 24.03.16.
//  Copyright © 2016 Muaviya. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var rayonLabel: UILabel!
    @IBOutlet weak var materialLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
