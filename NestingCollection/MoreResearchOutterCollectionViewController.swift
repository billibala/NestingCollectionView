//
//  MoreResearchOutterCollectionViewController.swift
//  NestingCollection
//
//  Created by Bill So on 9/26/16.
//  Copyright © 2016 Headnix. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MoreResearchOutterCollectionViewController: OutterCollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		products = ProductUtility.randomGenerate(numberOf: 20)
		nestedViewPositionIndex = 10
		isLoadingProductDataOnCreate = false
    }

	// MARK: UICollectionViewDelegate
	var firstPass = true

	override func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
		if indexPath.row == nestedViewPositionIndex {
			// set data source only when the cell is about to display
			if let cell = cell as? LayoutAttributesModifyingContainerCell {
				print("will display container cell \(indexPath)")
				if !firstPass && cell.products == nil {
//					cell.products = nestedProducts
				}
				if firstPass {
					firstPass = false
				}
			}
		}
	}
}
