//
//  ThirdOutterCollectionViewController.swift
//  NestingCollection
//
//  Created by Bill So on 8/7/16.
//  Copyright © 2016 Headnix. All rights reserved.
//

import UIKit

let SecondContainerCellIdentifier = "SecondContainerCellIdentifier"

class ThirdOutterCollectionViewController: UICollectionViewController {
	
	let products = ProductUtility.randomGenerate(numberOf: 20)
	let nestedProducts = ProductUtility.randomGenerate(numberOf: 4)
	let secondNestedProducts = ProductUtility.randomGenerate(numberOf: 9)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Uncomment the following line to preserve selection between presentations
		// self.clearsSelectionOnViewWillAppear = false
		
		guard let collectionView = collectionView else {
			fatalError()
		}
		
		collectionView.registerClass(SimpleLabelCell.self, forCellWithReuseIdentifier: LabelCellIdentifier)
		collectionView.registerClass(ControllerContainingCollectionViewCell.self, forCellWithReuseIdentifier: ContainerCellIdentifier)
		collectionView.registerClass(ControllerContainingCollectionViewCell.self, forCellWithReuseIdentifier: SecondContainerCellIdentifier)
		
		if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout {
			let width = collectionView.bounds.size.width
			let contentInsets = UIEdgeInsets(top: 16, left: 12, bottom: 16, right: 12)
			// use self-sizing cell
			flowLayout.estimatedItemSize = CGSize(width: width - contentInsets.left - contentInsets.right, height: 50)
			flowLayout.sectionInset = contentInsets
			flowLayout.scrollDirection = .Vertical
			flowLayout.minimumLineSpacing = 12
		}
		
		// Do any additional setup after loading the view.
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// MARK: UICollectionViewDataSource
	
	override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		// 2 extras for the nested cells
		return products.count + 2
	}
	
	override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		switch indexPath.row {
		case 10:
			// build a nested collection view
			let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ContainerCellIdentifier, forIndexPath: indexPath) as! ControllerContainingCollectionViewCell
			cell.parentController = self
			cell.products = nestedProducts
			
			return cell
		case 21:
			// build a nested collection view
			let cell = collectionView.dequeueReusableCellWithReuseIdentifier(SecondContainerCellIdentifier, forIndexPath: indexPath) as! ControllerContainingCollectionViewCell
			cell.parentController = self
			cell.products = secondNestedProducts
			
			return cell
		default:
			let row = indexPath.row + (indexPath.row < 10 ? 0 : -1)
			// normal content cell
			let cell = collectionView.dequeueReusableCellWithReuseIdentifier(LabelCellIdentifier, forIndexPath: indexPath) as! SimpleLabelCell
			cell.product = products[row]
			
			return cell
		}
	}
	
	// MARK: UICollectionViewDelegate
	var firstPass = true
	var anotherRowFirstPass = true
	
	override func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
		if indexPath.row == 10 {
			// set data source only when the cell is about to display
			if let cell = cell as? ControllerContainingCollectionViewCell {
				if firstPass {
					firstPass = false
				} else {
					cell.presentNestedCollectionController()
				}
			}
		} else if indexPath.row == 21 {
			if let cell = cell as? ControllerContainingCollectionViewCell {
//				if anotherRowFirstPass {
//					anotherRowFirstPass = false
//				} else {
					cell.presentNestedCollectionController()
//				}
			}
		}
	}
}
