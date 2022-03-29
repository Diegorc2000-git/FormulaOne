//
//  ProfileRouter.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 2/3/22.
//

import Foundation

protocol ProfileRouterProtocol: BaseRouterProtocol {
	func closeSesion()
}

final class ProfileRouter: BaseRouter {
	
	private weak var view: ProfileViewController? { return super.baseView as? ProfileViewController }
	
}

extension ProfileRouter: ProfileRouterProtocol {
	
	func closeSesion() {
		dismiss(animated: true)
	}
}
