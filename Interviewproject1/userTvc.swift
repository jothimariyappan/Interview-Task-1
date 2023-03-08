//
//  userTvc.swift
//  Interviewproject1
//
//  Created by Jo on 17/01/23.
//

import UIKit

class userTvc: UITableViewCell {

    @IBOutlet var imgprofile: UIImageView!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblEmail: UILabel!
    @IBOutlet var btnstar: UIButton!
    @IBOutlet var imgstar: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
