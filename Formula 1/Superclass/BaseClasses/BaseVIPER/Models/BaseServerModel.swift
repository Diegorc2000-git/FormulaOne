//
//  BaseServerModel.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 18/3/22.
//

import Foundation

protocol BaseServerModel: Codable {}

extension BaseServerModel {
	func encode() -> [String: Any]? {
		guard let jsonData = try? JSONEncoder().encode(self),
			  let json = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any]
		else { return nil }
		
		return json
	}
}

extension Array where Element: BaseServerModel {
	func encode() -> [[String: Any]]? {
		guard let jsonData = try? JSONEncoder().encode(self),
			  let json = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [[String: Any]]
		else { return nil }
		
		return json
	}
}
