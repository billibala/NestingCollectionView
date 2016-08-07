//
//  ContainerCell.swift
//  NestingCollection
//
//  Created by Bill So on 8/5/16.
//  Copyright © 2016 Headnix. All rights reserved.
//

import UIKit

private let ContentCellIdentifier = "ContentCellIdentifier"

class ContainerCell: UICollectionViewCell, UICollectionViewDataSource {
	var products: [Product]? {
		didSet {
			nestedCollectionView.dataSource = self
			nestedCollectionView.reloadData()
		}
	}
	
	private let nestedCollectionView: UICollectionView = {
		let flowLayout = UICollectionViewFlowLayout()
		flowLayout.estimatedItemSize = CGSize(width: 168, height: 320)
		flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
flowLayout.scrollDirection = .Horizontal
		
		let view = UICollectionView(frame: CGRectZero, collectionViewLayout: flowLayout)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = UIColor.yellowColor()
		
		view.registerClass(InnerContentCell.self, forCellWithReuseIdentifier: ContentCellIdentifier)
		
		return view
	}()
	
	private lazy var tabBar: FakeTabBar = {
		let bar = FakeTabBar(frame: CGRectZero)
		bar.translatesAutoresizingMaskIntoConstraints = false
		
		return bar
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		contentView.addSubview(tabBar)
		contentView.addSubview(nestedCollectionView)
		
		NSLayoutConstraint(item: tabBar, attribute: .Top, relatedBy: .Equal, toItem: contentView, attribute: .Top, multiplier: 1, constant: 0).active = true
		NSLayoutConstraint(item: tabBar, attribute: .Leading, relatedBy: .Equal, toItem: contentView, attribute: .Leading, multiplier: 1, constant: 0).active = true
		NSLayoutConstraint(item: tabBar, attribute: .Trailing, relatedBy: .Equal, toItem: contentView, attribute: .Trailing, multiplier: 1, constant: 0).active = true

		NSLayoutConstraint(item: nestedCollectionView, attribute: .Top, relatedBy: .Equal, toItem: tabBar, attribute: .Bottom, multiplier: 1, constant: 0).active = true
		NSLayoutConstraint(item: nestedCollectionView, attribute: .Leading, relatedBy: .Equal, toItem: contentView, attribute: .Leading, multiplier: 1, constant: 0).active = true
		NSLayoutConstraint(item: nestedCollectionView, attribute: .Trailing, relatedBy: .Equal, toItem: contentView, attribute: .Trailing, multiplier: 1, constant: 0).active = true
		NSLayoutConstraint(item: nestedCollectionView, attribute: .Bottom, relatedBy: .Equal, toItem: contentView, attribute: .Bottom, multiplier: 1, constant: 0).active = true
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// ========================================
	// Uncomment this method to solve the crash
	// ========================================
	override func preferredLayoutAttributesFittingAttributes(layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
		let superAttributes = super.preferredLayoutAttributesFittingAttributes(layoutAttributes)
		superAttributes.size.width = layoutAttributes.size.width
		superAttributes.size.height = 400
		print("container width: \(superAttributes.size.width)")
		
		return superAttributes
	}
	
	//MARK: data source
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return products?.count ?? 0
	}
	
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ContentCellIdentifier, forIndexPath: indexPath) as! InnerContentCell
		
		cell.product = products![indexPath.row]
		
		return cell
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		print("layout subviews \(contentView.bounds.size)")
		if contentView.bounds.size.height > 100 {
//			self.performSelector(#selector(UICollectionView.reloadData), withObject: nestedCollectionView, afterDelay: 3)
//			nestedCollectionView.reloadData()
		}
	}
	
	override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
		print("apply layout attributes")
		super.applyLayoutAttributes(layoutAttributes)
	}
}

class FakeTabBar: UIView {
	let mySize = CGSize(width: 100, height: 25)
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = UIColor.cyanColor()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func intrinsicContentSize() -> CGSize {
		return mySize
	}

}
