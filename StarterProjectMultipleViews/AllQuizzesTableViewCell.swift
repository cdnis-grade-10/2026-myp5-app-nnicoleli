//
//  AllQuizzesTableViewCell.swift
//  StarterProjectMultipleViews
//
//  Created by Nicole on 19/3/2026.
//

import UIKit

class AllQuizzesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var quizImageView: UIImageView!
    @IBOutlet weak var quizDescriptionLabel: UILabel!
    @IBOutlet weak var quizTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // enable selection
        selectionStyle = .default
        isUserInteractionEnabled = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
