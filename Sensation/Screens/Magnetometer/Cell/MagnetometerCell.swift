//
//  AccelerometerCell.swift
//  Sensation
//
//  Created by Hüsamettin Eyibil on 20.11.2021.
//

import UIKit

class MagnetometerCell: UITableViewCell {
    
    public static let identifier = "MagnetometerCell"

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
