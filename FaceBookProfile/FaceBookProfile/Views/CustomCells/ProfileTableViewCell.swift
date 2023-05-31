//
//  ProfileTableViewCell.swift
//  FaceBookProfile
//
//  Created by 편성경 on 2023/05/24.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    func setup() {
        profileImageView.image = UIImage(named: "bayMax")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
