//
//  ControllerContainingCollectionViewCell.swift
//  NestingCollection
//
//  Created by Bill So on 8/8/16.
//  Copyright © 2016 Headnix. All rights reserved.
//

import UIKit

class ControllerContainingCollectionViewCell: UICollectionViewCell {
	weak var parentController: UIViewController?
	var products: [Product]?
	
	private lazy var nestedCollectionViewController: HorizontalCollectionViewController = {
		let flowLayout = UICollectionViewFlowLayout()
		flowLayout.estimatedItemSize = CGSize(width: 168, height: 320)
		flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
		flowLayout.scrollDirection = .Horizontal

		let controller = HorizontalCollectionViewController(collectionViewLayout: flowLayout)
		
		return controller
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	var onceToken: dispatch_once_t = 0
	
	func presentNestedCollectionController() {
		dispatch_once(&onceToken) {
			print("load nested view")
			guard let parentController = self.parentController else {
				// can't present the view controller
				return
			}
			self.nestedCollectionViewController.products = self.products
			
			parentController.addChildViewController(self.nestedCollectionViewController)
			self.nestedCollectionViewController.view.frame = self.contentView.bounds
			self.contentView.addSubview(self.nestedCollectionViewController.view)
			self.nestedCollectionViewController.didMoveToParentViewController(parentController)
	
	//		nestedCollectionViewController.collectionView?.reloadData()
		}
	}
	
	override func preferredLayoutAttributesFittingAttributes(layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
		let superAttributes = super.preferredLayoutAttributesFittingAttributes(layoutAttributes)
		superAttributes.size.width = layoutAttributes.size.width
		superAttributes.size.height = 400
		print("container width: \(superAttributes.size.width)")
		
		return superAttributes
	}
}
