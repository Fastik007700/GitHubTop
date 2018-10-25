//
//  MainControllerCell.swift
//  GitHubTest
//
//  Created by Mikhail on 23/10/2018.
//  Copyright © 2018 Mikhail. All rights reserved.
//

import UIKit
import Kingfisher

class MainControllerCell: UITableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var projectName: UILabel!
    
    @IBOutlet weak var starsCount: UILabel!
    
    
    var accURL: String?
    var reposLink: String?
    var login: String?
    
    var avatarURL = "" {
        didSet {
            if let url = URL(string: avatarURL) {
                avatar.kf.indicatorType = .activity
                avatar.kf.setImage(with: url)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatar.layer.cornerRadius = avatar.frame.width/2
        avatar.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
