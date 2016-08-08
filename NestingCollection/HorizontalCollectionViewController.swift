//
//  HorizontalCollectionViewController.swift
//  NestingCollection
//
//  Created by Bill So on 8/8/16.
//  Copyright © 2016 Headnix. All rights reserved.
//

import UIKit

class HorizontalCollectionViewController: UICollectionViewController {
	var products: [Product]?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		guard let collectionView = collectionView else {
			return
		}
		
		collectionView.registerClass(InnerContentCell.self, forCellWithReuseIdentifier: ContentCellIdentifier)
	}

	override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return products?.count ?? 0
	}
	
	override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ContentCellIdentifier, forIndexPath: indexPath) as! InnerContentCell
		cell.product = products![indexPath.row]
		return cell
	}
}
