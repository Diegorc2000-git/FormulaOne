//
//  SplashRouter.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 17/3/22.
//

import Foundation

protocol SplashRouterProtocol: BaseRouterProtocol {
	func navigateToHome()
}

final class SplashRouter: BaseRouter {
	
	private weak var view: SplashViewController? { return super.baseView as? SplashViewController }
	
}

extension SplashRouter: SplashRouterProtocol {
	
	func navigateToHome() {
		let vc = LoginAssembly.navigationController()
		vc.modalTransitionStyle = .crossDissolve
		vc.modalPresentationStyle = .fullScreen
		self.view?.present(vc, animated: true, completion: nil)
	}
}
