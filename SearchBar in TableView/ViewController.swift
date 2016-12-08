//
//  ViewController.swift
//  SearchBar in TableView
//
//  Created by Satori Maru on 16.12.08.
//  Copyright © 2016年 Satori Maru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var searchBar: UISearchBar!

	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.rowHeight = 80
		tableView.estimatedRowHeight = tableView.rowHeight
		tableView.contentInset = UIEdgeInsets(top: -searchBar.frame.size.height, left: 0, bottom: 0, right: 0)
		tableView.contentOffset.y = searchBar.frame.size.height
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

}

extension ViewController: UIScrollViewDelegate {
	
	func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
		let offset = scrollView.contentOffset.y
		
		if offset > searchBar.frame.size.height {
			scrollView.contentInset = UIEdgeInsets.zero
			return
		}
		
		let top = (offset > searchBar.frame.size.height / 2.0) ? -searchBar.frame.size.height : CGFloat(0)
		
		scrollView.contentInset = UIEdgeInsets(top: top, left: 0, bottom: 0, right: 0)
		scrollView.contentOffset.y = offset
	}
}
