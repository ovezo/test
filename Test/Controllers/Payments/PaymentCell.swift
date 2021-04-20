//
//  PaymentCell.swift
//  Test
//
//  Created by Owez Orazberdiyew on 4/20/21.
//

import UIKit

class PaymentCell: UITableViewCell {
    
    static public let identifier = "PaymentCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with payment: Payment){
        titleLabel.text = payment.description
        createdAtLabel.text = payment.getDate()
        currencyLabel.text = payment.currency
        amountLabel.text = "\(payment.amount ?? 0)"
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
}
