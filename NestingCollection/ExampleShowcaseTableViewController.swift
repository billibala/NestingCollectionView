//
//  ExampleShowcaseTableViewController.swift
//  NestingCollection
//
//  Created by Bill So on 9/26/16.
//  Copyright © 2016 Headnix. All rights reserved.
//

import UIKit

class ExampleShowcaseTableViewController: UITableViewController {
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		guard let identifier = segue.identifier else {
			return
		}

		switch identifier {
		case "FirstAttempt":
			let vc = segue.destinationViewController as! OutterCollectionViewController
			vc.useCellAttributesFix = false

		case "PartialFix":
			let vc = segue.destinationViewController as! OutterCollectionViewController
			vc.useCellAttributesFix = true

		case "PartialFixFail":
			let vc = segue.destinationViewController as! FailCasePartialFixOutterCollectionViewController
			vc.useCellAttributesFix = true

		case "CompleteFix":
			break
		default:
			break
		}
	}

}
