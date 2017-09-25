//
//  KivaCell.swift
//  WorkWithJSON
//
//  Created by Chris Huang on 25/09/2017.
//  Copyright © 2017 Chris Huang. All rights reserved.
//

import UIKit

class KivaCell: UITableViewCell {

	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var countryLabel: UILabel!
	@IBOutlet weak var useLabel: UILabel!
	@IBOutlet weak var amountLabel: UILabel!
	
	var loan: Loan? {
		didSet {
			nameLabel.text = loan?.name ?? "No name"
			countryLabel.text = loan?.location?.country ?? "No Country"
			useLabel.text = loan?.use ?? "No purpose"
			amountLabel.text = "$\(loan?.loan_amount ?? 0)"
		}
	}

}
