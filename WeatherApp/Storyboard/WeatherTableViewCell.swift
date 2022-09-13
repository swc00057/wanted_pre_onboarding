//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by 신동원 on 2022/09/14.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    static let identifier = "WeatherTableViewCell"
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var humidity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        self.selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
