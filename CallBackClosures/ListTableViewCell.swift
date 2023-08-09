//
//  ListTableViewCell.swift
//  CallBackClosures
//
//  Created by Kumaran on 09/08/23.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var listTitleLabel: UILabel!
    
    var callBack: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(listTitle: String?) {
        listTitleLabel.text = listTitle ?? "No Data"
    }
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        callBack?()
    }
}
