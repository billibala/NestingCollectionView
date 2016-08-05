//
//  OutterCollectionViewController.swift
//  NestingCollection
//
//  Created by Bill So on 8/5/16.
//  Copyright © 2016 Headnix. All rights reserved.
//

import UIKit

private let ContainerCellIdentifier = "ContainerCellIdentifier"
private let LabelCellIdentifier = "ContentCellIdentifier"

class OutterCollectionViewController: UICollectionViewController {
	
	let products = ProductUtility.randomGenerate(numberOf: 10)
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
			flowLayout.estimatedItemSize = CGSize(width: width - contentInsets.left - contentInsets.right, height: 80)
			flowLayout.sectionInset = contentInsets
			flowLayout.scrollDirection = .Vertical
			flowLayout.minimumLineSpacing = 12
//			flowLayout.headerReferenceSize = CGSize(width: width, height: 300)
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
		if indexPath.row == 2 {
			// build a nested collection view
			let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ContainerCellIdentifier, forIndexPath: indexPath) as! ContainerCell
			cell.products = nestedProducts
			
			return cell
		} else {
			let row = indexPath.row + (indexPath.row < 2 ? 0 : 1)
			// normal content cell
			let cell = collectionView.dequeueReusableCellWithReuseIdentifier(LabelCellIdentifier, forIndexPath: indexPath) as! SimpleLabelCell
			cell.product = products[row]

			return cell
		}
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
