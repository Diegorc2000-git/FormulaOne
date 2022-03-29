//
//  ProfileAssembly.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 2/3/22.
//

import Foundation
import UIKit

final class ProfileAssembly: BaseAssembly {
	
	static func navigationController() -> UINavigationController {
		let navigationController = UINavigationController(rootViewController: view())
		return navigationController
	}

	static func view() -> ProfileViewController {
		let view = ProfileViewController()

		_ = BaseAssembly.assembly(baseView: view,
										  presenter: ProfilePresenter.self,
										  router: ProfileRouter.self,
										  interactor: ProfileInteractor.self)

		return view
	}
}

class ProfileAssemblyDTO {
	
}
