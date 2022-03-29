//
//  LoginRouter.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 28/3/22.
//

import Foundation
import UIKit

protocol LoginRouterProtocol: BaseRouterProtocol {
	func navigateToProfile(email: String, password: String)
	func navigateToModalError()
}

final class LoginRouter: BaseRouter {
	
	private weak var view: LoginViewController? { return super.baseView as? LoginViewController }
	
}

extension LoginRouter: LoginRouterProtocol {
	func navigateToProfile(email: String, password: String) {
		self.pushViewController(TabBarHomeAssembly.view(), animated: true)
	}
	
	func navigateToModalError() {
		let alertController = UIAlertController(title: "Error",
												message: "Ha ocurrido un error, intentalo de nuevo mas tarde",
												preferredStyle: .alert)
		alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
		self.present(alertController, animated: true, completion: nil)
	}
	
}
