//
//  Loan.swift
//  WorkWithJSON
//
//  Created by Chris Huang on 25/09/2017.
//  Copyright © 2017 Chris Huang. All rights reserved.
//

import Foundation

struct Kiva: Decodable {
	var loans: [Loan]?
}

struct Loan: Decodable {
	
	struct Location: Decodable {
		var country: String = ""
	}
	
	var name: String = ""
	var use: String = ""
	var loan_amount: Int = 0
	var location: Location?
}
