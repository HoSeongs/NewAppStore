//
//  AppListCell.swift
//  NewAppStore
//
//  Created by 최호성 on 2018. 6. 6..
//  Copyright © 2018년 최호성. All rights reserved.
//

import UIKit

class AppListCell: UITableViewCell {    
    
    @IBOutlet weak var appImage: UIImageView!
    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var appRanking: UILabel!
    @IBOutlet weak var appDescription: UILabel!
    @IBOutlet weak var downButton: UIButton!
    
    @IBAction func appDownload(_ sender: Any) {
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        appImage.image = nil
        appName.text = nil
        appRanking.text = nil
        appDescription.text = nil
        downButton.setTitle("", for: UIControlState.normal)
    }
    
    
    

}
