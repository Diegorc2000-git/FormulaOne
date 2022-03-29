//
//  BaseBusinessModel.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 18/3/22.
//

import Foundation

class BaseBusinessModel: NSObject {
	override init() {}

	required init(serverModel: BaseServerModel?) {}
	
	func copyObject() -> Self? {
		return self.copy() as? Self
	}
}
