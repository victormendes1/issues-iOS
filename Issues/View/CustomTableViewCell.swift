//
//  CustomTableViewCell.swift
//  Issues
//
//  Created by Victor Mendes on 02/08/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var titleCellLabel: UILabel!
    @IBOutlet weak var descriptionCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
