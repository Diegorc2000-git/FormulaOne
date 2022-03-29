//
//  SplashInteractor.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 17/3/22.
//

import Foundation

protocol SplashInteractorInputProtocol: BaseInteractorInputProtocol {
	
}

class SplashInteractor: BaseInteractor {
	
	private var presenter: SplashInteractorOutputProtocol? { return super.basePresenter as? SplashInteractorOutputProtocol }
	
}

extension SplashInteractor: SplashInteractorInputProtocol {
	
}
