//
//  RacingRouter.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 2/3/22.
//

import Foundation

protocol RacingRouterProtocol {
	
}

final class RacingRouter {
	
	let vc: RacingViewController?
	
	init(vc: RacingViewController) {
		self.vc = vc
	}
}

extension RacingRouter: RacingRouterProtocol {
	
}
