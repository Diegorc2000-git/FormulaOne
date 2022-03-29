//
//  BaseProtocols.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 2/3/22.
//

import Foundation

//MARK: - View
protocol BaseViewProtocol: AnyObject {
	func setViewModel(_ viewModel: Any)
}

extension BaseViewProtocol {
	func setViewModel(_ viewModel: Any) {}
}

//MARK: - Presenter
protocol BasePresenterProtocol: AnyObject {
	func viewDidLoad()
	func backNavigationBarButtonPressed()
}

extension BasePresenterProtocol {
	
}

//MARK: - Interactor
protocol BaseInteractorInputProtocol: AnyObject {
	
}

extension BaseInteractorInputProtocol {

}

protocol BaseInteractorOutputProtocol: AnyObject {
	
}

extension BaseInteractorOutputProtocol {
	
}
//MARK: - Router
protocol BaseRouterProtocol: AnyObject {
	func backToPreviousScreen()
	func cancelFlow()
	func getNavigationType() -> BaseRouter.NavigationType?
}

extension BaseRouterProtocol {
	
}

protocol BaseRouterDelegate: AnyObject {
	func navigationDone()
}

extension BaseRouterDelegate {
	
}

//MARK: - Provider
protocol BaseProviderDelegate: AnyObject {
	
}
