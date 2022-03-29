//
//  RacingAssembly.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 2/3/22.
//

import Foundation
import UIKit

final class RacingAssembly {
	
	static func navigation() -> UINavigationController {
		UINavigationController(rootViewController: view())
	}
	
	static func view() -> RacingViewController {
		let vc = RacingViewController()
		vc.presenter = presenter(vc: vc)
		return vc
	}
	
	static func presenter(vc: RacingViewController) -> RacingPresenterProtocol {
		let presenter = RacingPresenter(vc: vc)
		presenter.router = router(vc: vc)
		return presenter
	}
	
	static func router(vc: RacingViewController) -> RacingRouterProtocol {
		let router = RacingRouter(vc: vc)
		return router
	}
}
