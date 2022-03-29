//
//  StandingRouter.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 2/3/22.
//

import Foundation

protocol StandingRouterProtocol {
	
}

final class StandingRouter {
	
	let vc: StandingViewController?
	
	init(vc: StandingViewController) {
		self.vc = vc
	}
	
}

extension StandingRouter: StandingRouterProtocol {
	
}
