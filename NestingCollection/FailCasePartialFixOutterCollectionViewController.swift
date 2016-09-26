//
//  FailCasePartialFixOutterCollectionViewController.swift
//  NestingCollection
//
//  Created by Bill So on 8/6/16.
//  Copyright © 2016 Headnix. All rights reserved.
//

import UIKit

class FailCasePartialFixOutterCollectionViewController: OutterCollectionViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		products = ProductUtility.randomGenerate(numberOf: 20)
		nestedViewPositionIndex = 10
	}

}

