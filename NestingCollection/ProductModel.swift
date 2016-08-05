//
//  ProductModel.swift
//  NestingCollection
//
//  Created by Bill So on 8/5/16.
//  Copyright © 2016 Headnix. All rights reserved.
//

import Foundation

struct Product {
	let name: String
	let ID: Int
}

class ProductUtility {
	static func randomGenerate(numberOf count: Int) -> [Product] {
		var products: [Product] = []
		for _ in 0..<count {
			let randID = Int(arc4random())
			products.append(Product(name: "Product \(randID)", ID: randID))
		}
		return products
	}
}
