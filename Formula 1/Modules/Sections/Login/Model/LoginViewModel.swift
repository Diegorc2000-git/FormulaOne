//
//  LoginViewModel.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 28/3/22.
//

import Foundation

class LoginViewModel: BaseViewModel {
	// Login
	let screenTitle: String = LocalizedKeys.login.loginTitle
	let buttonLogin: String = LocalizedKeys.login.buttonLogin
	let buttonRegister: String = LocalizedKeys.login.buttonRegister
	let loginTitle: String = LocalizedKeys.login.loginTitle
	let emailLoginTextField: String = LocalizedKeys.login.emailTextField
	let passwordLoginTextField: String = LocalizedKeys.login.passwordTextField
	let forgotPassword: String = LocalizedKeys.login.forgotPassword
	let createAccount: String = LocalizedKeys.login.createAccount
	// SignIn
	let signupTitle: String = LocalizedKeys.Register.signupTitle
	let emailSignInTextField: String = LocalizedKeys.Register.emailTextField
	let passwordSignInTextField: String = LocalizedKeys.Register.passwordTextField
	let signupButton: String = LocalizedKeys.Register.signupButton
	let loginButton: String = LocalizedKeys.Register.loginButton
	// Modals
	let modalErrorTitle: String = LocalizedKeys.Modal.modalErrorTitle
	let modalErrorDescription: String = LocalizedKeys.Modal.modalErrorDescription
	let modalErrorButtonAccept: String = LocalizedKeys.Modal.modalErrorButtonAccept
	let modalEmptyFieldsTitle: String = LocalizedKeys.Modal.modalEmptyFieldsTitle
	let modalEmptyFieldsDescription: String = LocalizedKeys.Modal.modalEmptyFieldsDescription
	let modalEmptyFieldsButtonAccept: String = LocalizedKeys.Modal.modalEmptyFieldsButtonAccept
}
