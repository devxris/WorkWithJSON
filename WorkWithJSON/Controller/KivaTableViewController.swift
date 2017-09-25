//
//  KivaTableViewController.swift
//  WorkWithJSON
//
//  Created by Chris Huang on 25/09/2017.
//  Copyright © 2017 Chris Huang. All rights reserved.
//

import UIKit

class KivaTableViewController: UITableViewController {

	private let KivaLoanURL = "https://api.kivaws.org/v1/loans/newest.json"
	
	// MarK: Model
	var loans = [Loan]() { didSet { DispatchQueue.main.async { self.tableView.reloadData() } } }
	
	private func getLatestLoans() {
		guard let loanURL = URL(string: KivaLoanURL) else { return }
		let urlRequst = URLRequest(url: loanURL)
		URLSession.shared.dataTask(with: urlRequst) { [weak self] (data, response, error) in
			if let error = error { print(error.localizedDescription); return }
			guard let data = data else { return }
			do {
				let kiva = try JSONDecoder().decode(Kiva.self, from: data)
				guard let loans = kiva.loans else { return }
				self?.loans = loans
			} catch let jsonError {
				print(jsonError.localizedDescription)
			}
		}.resume()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.estimatedRowHeight = 92
		
		getLatestLoans()
	}
	
	// MARK: UITableViewDataSource and UITableViewDelegate
	
	override func numberOfSections(in tableView: UITableView) -> Int { return 1 }
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return loans.count }
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! KivaCell
		cell.loan = loans[indexPath.row]
		return cell
	}
}

