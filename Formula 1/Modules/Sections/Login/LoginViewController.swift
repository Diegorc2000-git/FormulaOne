//
//  LoginViewController.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 28/3/22.
//

import UIKit

protocol LoginViewProtocol: BaseViewProtocol {
	
}

class LoginViewController: BaseView {
	
	private var presenter: LoginPresenterProtocol? { return super.basePresenter as? LoginPresenterProtocol }
	var model = LoginViewModel()
	
	// MARK: - IBOutlets
	@IBOutlet weak var genericView: UIView!
	@IBOutlet weak var viewLoginSignup: UIView!
	@IBOutlet weak var logoF1LoginImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var stackViewTextFields: UIStackView!
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var loginButton: UIButton!
	@IBOutlet weak var signupButton: UIButton!
	@IBOutlet weak var forgotPasswordOptionButton: UIButton!
	@IBOutlet weak var loginOptionButton: UIButton!
	@IBOutlet weak var createAccountOptionButton: UIButton!
	
	override func viewDidLoad() {
        super.viewDidLoad()

		setupLoginView()
    }
	
	func setupLoginView() {
		forgotPasswordOptionButton.isHidden = false
		createAccountOptionButton.isHidden = false
		loginOptionButton.isHidden = true
		signupButton.isHidden = true
		loginButton.isHidden = false
		
		logoF1LoginImageView.image = UIImage(named: ImageAndIconConstants.logoAppRed)
		
		titleLabel.textColor = CustomColor.buttonTextPrimaryTextColor.uiColor
		titleLabel.font = CustomFont(fontType: .system, size: .XXXL).uiFont
		
		emailTextField.roundedByDefault(radious: 10)
		emailTextField.layer.borderColor = CustomColor.viewSecondary.uiColor.cgColor
		emailTextField.layer.borderWidth = 2
		let emailImage = UIImage(named: ImageAndIconConstants.mailIcon)
		addLeftImageTo(txtField: emailTextField, andImage: emailImage!)
		
		passwordTextField.roundedByDefault(radious: 10)
		passwordTextField.layer.borderColor = CustomColor.viewSecondary.uiColor.cgColor
		passwordTextField.layer.borderWidth = 2
		let passwordImage = UIImage(named: ImageAndIconConstants.passwordIcon)
		addLeftImageTo(txtField: passwordTextField, andImage: passwordImage!)
		
		loginButton.roundedByDefault()
		loginButton.titleLabel?.font = CustomFont(fontType: .system, size: .XL, style: .regular).uiFont
		loginButton.setTitleColor(CustomColor.buttonTextPrimaryTextColor.uiColor, for: .normal)
		loginButton.backgroundColor = CustomColor.viewContainer.uiColor
		loginButton.showBorder(borderWidth: 1, borderColor: CustomColor.viewSecondary.uiColor)
		
		forgotPasswordOptionButton.setTitleColor(CustomColor.buttonTextPrimaryTextColor.uiColor, for: .normal)
		forgotPasswordOptionButton.titleLabel?.font  = CustomFont(fontType: .system, size: .large).uiFont
		
		createAccountOptionButton.setTitleColor(CustomColor.buttonTextPrimaryTextColor.uiColor, for: .normal)
		createAccountOptionButton.titleLabel?.font = CustomFont(fontType: .system, size: .large).uiFont
		
		setupLabelsLogin(model)
	}
	
	func setupSignInView() {
		forgotPasswordOptionButton.isHidden = true
		createAccountOptionButton.isHidden = true
		loginOptionButton.isHidden = false
		signupButton.isHidden = false
		loginButton.isHidden = true
		
		logoF1LoginImageView.image = UIImage(named: ImageAndIconConstants.logoAppRed)
		
		titleLabel.textColor = CustomColor.buttonTextPrimaryTextColor.uiColor
		titleLabel.font = CustomFont(fontType: .system, size: .XXXL).uiFont
		
		emailTextField.roundedByDefault(radious: 10)
		emailTextField.layer.borderColor = CustomColor.viewSecondary.uiColor.cgColor
		emailTextField.layer.borderWidth = 2
		let emailImage = UIImage(named: ImageAndIconConstants.mailIcon)
		addLeftImageTo(txtField: emailTextField, andImage: emailImage!)
		
		passwordTextField.roundedByDefault(radious: 10)
		passwordTextField.layer.borderColor = CustomColor.viewSecondary.uiColor.cgColor
		passwordTextField.layer.borderWidth = 2
		let passwordImage = UIImage(named: ImageAndIconConstants.passwordIcon)
		addLeftImageTo(txtField: passwordTextField, andImage: passwordImage!)
		
		signupButton.roundedByDefault()
		signupButton.titleLabel?.font = CustomFont(fontType: .system, size: .XL, style: .regular).uiFont
		signupButton.setTitleColor(CustomColor.buttonTextPrimaryTextColor.uiColor, for: .normal)
		signupButton.backgroundColor = CustomColor.viewContainer.uiColor
		signupButton.showBorder(borderWidth: 1, borderColor: CustomColor.viewSecondary.uiColor)
		
		forgotPasswordOptionButton.setTitleColor(CustomColor.buttonTextPrimaryTextColor.uiColor, for: .normal)
		forgotPasswordOptionButton.titleLabel?.font  = CustomFont(fontType: .system, size: .large).uiFont
		
		loginOptionButton.setTitleColor(CustomColor.buttonTextPrimaryTextColor.uiColor, for: .normal)
		loginOptionButton.titleLabel?.font  = CustomFont(fontType: .system, size: .large).uiFont
		
		createAccountOptionButton.setTitleColor(CustomColor.buttonTextPrimaryTextColor.uiColor, for: .normal)
		createAccountOptionButton.titleLabel?.font = CustomFont(fontType: .system, size: .large).uiFont
		
		setupLabelsSignIn(model)
	}
	
	func addLeftImageTo(txtField: UITextField, andImage img: UIImage) {
		let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
		leftImageView.image = img
		txtField.leftView = leftImageView
		txtField.leftViewMode = .always
	}
	
	@IBAction func forgotPasswordPressed(_ sender: Any) {
		// TODO: Funcion recuperar contraseña
	}
	
	@IBAction func createAccountPressed(_ sender: Any) {
		setupSignInView()
	}
	
	@IBAction func loginPressed(_ sender: Any) {
		setupLoginView()
	}
	
	@IBAction func signupButtonAction(_ sender: Any) {
		if emailTextField.text == "" || passwordTextField.text == "" {
			let alertController = UIAlertController(title: model.modalEmptyFieldsTitle,
													message: model.modalEmptyFieldsDescription,
													preferredStyle: .alert)
			alertController.addAction(UIAlertAction(title: model.modalEmptyFieldsButtonAccept, style: .default))
			self.presentViewControllerModally(viewController: alertController, animated: true)
		} else {
			if let email = self.emailTextField.text , let password = self.passwordTextField.text {
				self.presenter?.signupPressed(email: email, password: password)
			} else {
				let alertController = UIAlertController(title: model.modalErrorTitle,
														message: model.modalErrorDescription,
														preferredStyle: .alert)
				alertController.addAction(UIAlertAction(title: model.modalErrorButtonAccept, style: .default))
				self.presentViewControllerModally(viewController: alertController, animated: true)
			}
		}
	}
	
	@IBAction func loginButtonAction(_ sender: Any) {
		if emailTextField.text == "" || passwordTextField.text == "" {
			let alertController = UIAlertController(title: model.modalEmptyFieldsTitle,
													message: model.modalEmptyFieldsDescription,
													preferredStyle: .alert)
			alertController.addAction(UIAlertAction(title: model.modalEmptyFieldsButtonAccept, style: .default))
			self.presentViewControllerModally(viewController: alertController, animated: true)
		} else {
			if let email = self.emailTextField.text , let password = self.passwordTextField.text {
				self.presenter?.loginPressed(email: email, password: password)
			} else {
				let alertController = UIAlertController(title: model.modalErrorTitle,
														message: model.modalErrorDescription,
														preferredStyle: .alert)
				alertController.addAction(UIAlertAction(title: model.modalErrorButtonAccept, style: .default))
				self.presentViewControllerModally(viewController: alertController, animated: true)
			}
		}
	}
}

extension LoginViewController: LoginViewProtocol {
	func setViewModel(_ viewModel: Any) {
		guard let model = viewModel as? LoginViewModel else {
			return }
		
		self.titleLabel.text = model.loginTitle
		self.emailTextField.placeholder = model.emailLoginTextField
		self.passwordTextField.placeholder = model.passwordLoginTextField
		self.loginOptionButton.setTitle(model.buttonLogin, for: .normal)
		self.forgotPasswordOptionButton.setTitle(model.forgotPassword, for: .normal)
		self.createAccountOptionButton.setTitle(model.createAccount, for: .normal)
	}
	
	func setupLabelsSignIn(_ viewModel: Any) {
		guard let model = viewModel as? LoginViewModel else {
			return }
		self.titleLabel.text = model.signupTitle
		self.emailTextField.placeholder = model.emailSignInTextField
		self.passwordTextField.placeholder = model.passwordSignInTextField
		self.signupButton.setTitle(model.buttonRegister, for: .normal)
		self.loginOptionButton.setTitle(model.buttonLogin, for: .normal)
	}
	
	func setupLabelsLogin(_ viewModel: Any) {
		guard let model = viewModel as? LoginViewModel else {
			return }
		self.titleLabel.text = model.loginTitle
		self.emailTextField.placeholder = model.emailLoginTextField
		self.passwordTextField.placeholder = model.passwordLoginTextField
		self.loginButton.setTitle(model.buttonLogin, for: .normal)
		self.forgotPasswordOptionButton.setTitle(model.forgotPassword, for: .normal)
		self.createAccountOptionButton.setTitle(model.createAccount, for: .normal)
	}
}
