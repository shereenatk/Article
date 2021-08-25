//
//  HomeTVCell.swift
//  Popular Article
//
//  Created by Development  on 25/08/2021.
//

import Foundation
import UIKit
class HomeTVCell: UITableViewCell {
    
    @IBOutlet weak var dateButton: UIButton!
    @IBOutlet weak var byLineLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var autherImageView: UIImageView!{
        didSet{
            autherImageView.layer.cornerRadius = 40
            autherImageView.layer.masksToBounds = true
        }
    }
    
}
