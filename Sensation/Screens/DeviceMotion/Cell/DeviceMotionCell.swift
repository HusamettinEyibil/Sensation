//
//  AccelerometerCell.swift
//  Sensation
//
//  Created by Hüsamettin Eyibil on 20.11.2021.
//

import UIKit

class DeviceMotionCell: UITableViewCell {
    
    public static let identifier = "DeviceMotionCell"

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var heading: UILabel!
    @IBOutlet weak var roll: UILabel!
    @IBOutlet weak var pitch: UILabel!
    @IBOutlet weak var yaw: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
