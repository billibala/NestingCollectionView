//
//  DifferentOrderOtterCollectionViewController.swift
//  NestingCollection
//
//  Created by Bill So on 8/6/16.
//  Copyright © 2016 Headnix. All rights reserved.
//

import UIKit

class DifferentOrderOtterCollectionViewController: UICollectionViewController {
	
	let products = ProductUtility.randomGenerate(numberOf: 20)
	let nestedProducts = ProductUtility.randomGenerate(numberOf: 4)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Uncomment the following line to preserve selection between presentations
		// self.clearsSelectionOnViewWillAppear = false
		
		guard let collectionView = collectionView else {
			fatalError()
		}
		
		collectionView.registerClass(SimpleLabelCell.self, forCellWithReuseIdentifier: LabelCellIdentifier)
		collectionView.registerClass(ContainerCell.self, forCellWithReuseIdentifier: ContainerCellIdentifier)
		
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
	
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
	// Get the new view controller using [segue destinationViewController].
	// Pass the selected object to the new view controller.
	}
	*/
	
	// MARK: UICollectionViewDataSource
	
	override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		// extra 1 is the `nestedProducts`
		return products.count + 1
	}
	
	override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		if indexPath.row == 10 {
			// build a nested collection view
			let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ContainerCellIdentifier, forIndexPath: indexPath) as! ContainerCell
//			cell.products = nestedProducts
			
			return cell
		} else {
			let row = indexPath.row + (indexPath.row < 10 ? 0 : -1)
			// normal content cell
			let cell = collectionView.dequeueReusableCellWithReuseIdentifier(LabelCellIdentifier, forIndexPath: indexPath) as! SimpleLabelCell
			cell.product = products[row]
			
			return cell
		}
	}
	
	// MARK: UICollectionViewDelegate
	var firstPass = true
	
	override func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
		if indexPath.row == 10 {
			// set data source only when the cell is about to display
			if let cell = cell as? ContainerCell {
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
