//
//  SplashAssembly.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 17/3/22.
//

import Foundation
import UIKit

final class SplashAssembly: BaseAssembly {
	
	static func navigationController() -> UINavigationController {
		let navigationController = UINavigationController(rootViewController: view())
		return navigationController
	}
	
	static func view() -> SplashViewController {
		let view = SplashViewController()
		
		_ = BaseAssembly.assembly(baseView: view,
										  presenter: SplashPresenter.self,
										  router: SplashRouter.self,
										  interactor: SplashInteractor.self)
		
		return view
	}
}

class SplashAssemblyDTO {
	
}
