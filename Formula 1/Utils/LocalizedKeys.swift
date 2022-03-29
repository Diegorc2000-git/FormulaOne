//
//  LocalizedKeys.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 18/3/22.
//

import Foundation

struct LocalizedKeys {
	
	struct Generic {
		static let buttonCancel = "nav_bar_button_cancel".localized // Cancel
	}
	
	struct Modal {
		static let modalErrorTitle = "modal_error_title".localized // Error
		static let modalErrorDescription = "modal_error_description".localized // Ha ocurrido un error, intentalo de nuevo mas tarde
		static let modalErrorButtonAccept = "modal_error_button_acept".localized // Aceptar
		static let modalEmptyFieldsTitle = "modal_empty_fields_title".localized // Error
		static let modalEmptyFieldsDescription = "modal_empty_fields_description".localized // Debes rellenar todos los campos
		static let modalEmptyFieldsButtonAccept = "modal_empty_fields_button".localized // Aceptar
	}
	
	struct TabBar {
		static let latest = "tab_bar_home_latest".localized // Latest
		static let video = "tab_bar_home_video".localized // Video
		static let racing = "tab_bar_home_racing".localized // Racing
		static let standing = "tab_bar_home_standing".localized // Standing
		static let profile = "tab_bar_home_profile".localized // Profile
	}
	
	struct Splash {
		static let splashCreatorText = "splash_creator_text".localized
	}
	
	struct login {
		static let buttonLogin = "login_button_title".localized // Login
		static let buttonRegister = "signup_button_title".localized // Signup
		static let loginTitle = "login_title".localized // Login
		static let emailTextField = "email_text_field_login".localized // Email
		static let passwordTextField = "password_text_field_login".localized // Contraseña
		static let forgotPassword = "forgor_password_button_login".localized // ¿Olvidaste la contraseña?
		static let createAccount = "create_account_button_login".localized // Crear cuenta
	}
	
	struct Register {
		static let signupTitle = "signup_title".localized // Signup
		static let emailTextField = "email_text_field_login".localized // Email
		static let passwordTextField = "password_text_field_login".localized // Contraseña
		static let signupButton = "signup_button_title".localized // Signup
		static let loginButton = "login_button_register".localized // Login
	}
	
}

extension String {
	var localized: String {
		return NSLocalizedString(self, comment: "")
	}
}
