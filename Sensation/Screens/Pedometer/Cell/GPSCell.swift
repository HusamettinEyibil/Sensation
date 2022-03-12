//
//  AccelerometerCell.swift
//  Sensation
//
//  Created by Hüsamettin Eyibil on 20.11.2021.
//

import UIKit

class GPSCell: UITableViewCell {
    
    public static let identifier = "GPSCell"

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
