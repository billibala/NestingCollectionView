//
//  ContainerCell.swift
//  NestingCollection
//
//  Created by Bill So on 8/5/16.
//  Copyright © 2016 Headnix. All rights reserved.
//

import UIKit

class ContainerCell: UICollectionViewCell {
	override func preferredLayoutAttributesFittingAttributes(layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
		let superAttributes = super.preferredLayoutAttributesFittingAttributes(layoutAttributes)
		superAttributes.size.width = layoutAttributes.size.width
		print("container width: \(superAttributes.size.width)")
		
		return superAttributes
	}
}
