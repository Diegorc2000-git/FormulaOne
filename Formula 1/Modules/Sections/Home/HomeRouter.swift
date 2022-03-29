//
//  HomeRouter.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 1/3/22.
//

import Foundation

protocol HomeRouterProtocol: BaseRouterProtocol {
	
}

final class HomeRouter: BaseRouter {
	
	private weak var view: HomeViewController? { return super.baseView as? HomeViewController }
	
}

extension HomeRouter: HomeRouterProtocol {
	
}
