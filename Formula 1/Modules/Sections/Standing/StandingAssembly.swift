//
//  StandingAssembly.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 2/3/22.
//

import Foundation
import UIKit

final class StandingAssembly {
	
	static func navigation() -> UINavigationController {
		UINavigationController(rootViewController: view())
	}
	
	static func view() -> StandingViewController {
		let vc = StandingViewController()
		vc.presenter = presenter(vc: vc)
		return vc
	}
	
	static func presenter(vc: StandingViewController) -> StandingPresenterProtocol {
		let presenter = StandingPresenter(vc: vc)
		presenter.router = router(vc: vc)
		return presenter
	}
	
	static func router(vc: StandingViewController) -> StandingRouterProtocol {
		let router = StandingRouter(vc: vc)
		return router
	}
}
