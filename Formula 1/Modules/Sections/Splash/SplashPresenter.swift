//
//  SplashPresenter.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 17/3/22.
//

import Foundation

protocol SplashPresenterProtocol: BasePresenterProtocol {
	func navigateToHome()
}

protocol SplashInteractorOutputProtocol: BaseInteractorOutputProtocol {
	
}

final class SplashPresenter: BasePresenter {
	
	weak var view: SplashViewProtocol? { return super.baseView as? SplashViewProtocol }
	var interactor: SplashInteractorInputProtocol? { return super.baseInteractor as? SplashInteractorInputProtocol }
	var router: SplashRouterProtocol? { return super.baseRouter as? SplashRouterProtocol }
	
	var viewModel = SplashViewModel()
	
	func viewDidLoad() {
		
	}
	
}

extension SplashPresenter: SplashPresenterProtocol {
	
	func navigateToHome() {
		self.router?.navigateToHome()
	}
}
