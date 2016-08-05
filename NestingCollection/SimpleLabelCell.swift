//
//  SimpleLabelCell.swift
//  NestingCollection
//
//  Created by Bill So on 8/5/16.
//  Copyright © 2016 Headnix. All rights reserved.
//

import UIKit

class SimpleLabelCell: UICollectionViewCell {
	var product: Product! {
		didSet {
			textLabel.text = product.name
		}
	}

	let textLabel: UILabel = {
		let label = UILabel(frame: CGRectZero)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = 0
		label.setContentCompressionResistancePriority(UILayoutPriorityDefaultHigh - 1, forAxis: .Horizontal)
//		label.preferredMaxLayoutWidth = 120
		
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		contentView.addSubview(textLabel)
		contentView.backgroundColor = UIColor.whiteColor()
		
		contentView.layoutMarginsGuide.leadingAnchor.constraintEqualToAnchor(textLabel.leadingAnchor).active = true
		contentView.layoutMarginsGuide.trailingAnchor.constraintEqualToAnchor(textLabel.trailingAnchor).active = true
		contentView.layoutMarginsGuide.topAnchor.constraintEqualToAnchor(textLabel.topAnchor).active = true
		contentView.layoutMarginsGuide.bottomAnchor.constraintEqualToAnchor(textLabel.bottomAnchor).active = true
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func preferredLayoutAttributesFittingAttributes(layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
		let superAttributes = super.preferredLayoutAttributesFittingAttributes(layoutAttributes)
		
		superAttributes.size.width = layoutAttributes.size.width
		print("simple cell width: \(superAttributes.size.width)")
		
		return superAttributes
	}
}
