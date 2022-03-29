////
////  LoginInteractor.swift
////  Formula 1
////
////  Created by Diego Rodriguez Casillas on 28/3/22.
////

import Foundation
import Firebase

protocol LoginInteractorInputProtocol: BaseInteractorInputProtocol {
	func loginRequest(email: String, password: String)
	func singupRequest(email: String, password: String)
}

class LoginInteractor: BaseInteractor {
	
	private var presenter: LoginInteractorOutputProtocol? { return super.basePresenter as? LoginInteractorOutputProtocol }
	
}

extension LoginInteractor: LoginInteractorInputProtocol {
	func loginRequest(email: String, password: String) {
		Auth.auth().signIn(withEmail: email, password: password) {
			(result, error) in
			
			if let result = result, error == nil {
				self.presenter?.loginSuccess(email: result.user.email!, password: password)
			} else {
				self.presenter?.loginFailure()
			}
		}
	}
	
	func singupRequest(email: String, password: String) {
		Auth.auth().createUser(withEmail: email, password: password) {
			(result, error) in
			
			if let result = result, error == nil {
				self.presenter?.singupSuccess(email: result.user.email!, password: password)
			} else {
				self.presenter?.singupFailure()
			}
		}
	}
}
