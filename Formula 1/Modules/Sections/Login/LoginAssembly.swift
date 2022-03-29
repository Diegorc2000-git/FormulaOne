//
//  LoginAssembly.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 28/3/22.
//

import Foundation
import UIKit

final class LoginAssembly: BaseAssembly {
	
	static func navigationController() -> UINavigationController {
		let navigationController = UINavigationController(rootViewController: view())
		return navigationController
	}
	
	static func view() -> LoginViewController {
		let view = LoginViewController()
		
		_ = BaseAssembly.assembly(baseView: view,
								  presenter: LoginPresenter.self,
								  router: LoginRouter.self,
								  interactor: LoginInteractor.self)
		
		return view
	}
}

class LoginAssemblyDTO {
	
}
