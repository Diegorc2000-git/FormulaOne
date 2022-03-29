//
//  BasePresenter.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 2/3/22.
//

import Foundation

class BasePresenter {
	
	internal weak var baseView: BaseViewProtocol?
	internal var baseRouter: BaseRouterProtocol?
	internal var baseInteractor: BaseInteractorInputProtocol?
	
	// Class initializer
	required init() {}
	
	// MARK: BasePresenterProtocol
	func backNavigationBarButtonPressed() {
		baseRouter?.backToPreviousScreen()
	}
}
