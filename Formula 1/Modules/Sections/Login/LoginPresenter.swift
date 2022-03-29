////
////  LoginPresenter.swift
////  Formula 1
////
////  Created by Diego Rodriguez Casillas on 28/3/22.
////

import Foundation
import UIKit

protocol LoginPresenterProtocol: BasePresenterProtocol {
	func signupPressed(email: String, password: String)
	func loginPressed(email: String, password: String)
}

protocol LoginInteractorOutputProtocol: BaseInteractorOutputProtocol {
	func loginSuccess(email: String, password: String)
	func singupSuccess(email: String, password: String)
	func loginFailure()
	func singupFailure()
	
}

final class LoginPresenter: BasePresenter {
	
	weak var view: LoginViewProtocol? { return super.baseView as? LoginViewProtocol }
	var interactor: LoginInteractorInputProtocol? { return super.baseInteractor as? LoginInteractorInputProtocol }
	var router: LoginRouterProtocol? { return super.baseRouter as? LoginRouterProtocol }
	
	var viewModel = LoginViewModel()
	
	func viewDidLoad() {
		view?.setViewModel(viewModel)
		//view?.setNavigationBar(title: viewModel.screenTitle)
	}
	
}

extension LoginPresenter: LoginPresenterProtocol {
	func loginPressed(email: String, password: String) {
		self.interactor?.loginRequest(email: email, password: password)
	}
	
	func signupPressed(email: String, password: String) {
		self.interactor?.singupRequest(email: email, password: password)
	}
	
}

extension LoginPresenter: LoginInteractorOutputProtocol {
	
	func loginSuccess(email: String, password: String) {
		self.router?.navigateToProfile(email: email, password: password)
	}
	
	func singupSuccess(email: String, password: String) {
		self.router?.navigateToProfile(email: email, password: password)
	}
	
	func loginFailure() {
		self.router?.navigateToModalError()
	}
	
	func singupFailure() {
		self.router?.navigateToModalError()
	}
	
}
