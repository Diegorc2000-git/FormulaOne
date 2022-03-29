//
//  HomeAssembly.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 1/3/22.
//

import Foundation
import UIKit

final class HomeAssembly: BaseAssembly {
	
	static func navigationController() -> UINavigationController {
		let navigationController = UINavigationController(rootViewController: view())
		return navigationController
	}
	
	static func view() -> HomeViewController {
		let view = HomeViewController()
		
		_ = BaseAssembly.assembly(baseView: view,
										  presenter: HomePresenter.self,
										  router: HomeRouter.self,
										  interactor: HomeInteractor.self)
		
		return view
	}
}

class HomeAssemblyDTO {
	
}
