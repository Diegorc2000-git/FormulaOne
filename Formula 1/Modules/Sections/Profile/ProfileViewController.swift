//
//  ProfileViewController.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 2/3/22.
//

import UIKit
import Firebase

protocol ProfileViewProtocol: BaseViewProtocol {

}

//enum ProviderType: String {
//	case basic
//}

class ProfileViewController: BaseView {
	
	private var presenter: ProfilePresenterProtocol? { return super.basePresenter as? ProfilePresenterProtocol }
	
	// MARK: IBOutlets
	@IBOutlet weak var emailLabel: UILabel!
	@IBOutlet weak var providerLabel: UILabel!
	@IBOutlet weak var closeSessionButton: UIButton!
	
//	private let email: String
//	private let provider: ProviderType
//
//	init(email: String, provider: ProviderType) {
//		self.email = email
//		self.provider = provider
//		super.init(nibName: nil, bundle: nil)
//	}
//
//	required init?(coder: NSCoder) {
//		fatalError("init(coder:) has not been implemented")
//	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
//		emailLabel.text = email
//		providerLabel.text = provider.rawValue
	}

//	// MARK: IBActions
//	@IBAction func closeSessionButtonAction(_ sender: Any) {
//
//		switch provider {
//		case .basic:
//			do {
//				try Auth.auth().signOut()
//				self.presenter?.closeSesionPressed()
//
//			} catch {
//				let alertController = UIAlertController(title: "Error",
//														message: "Se ha producido un error al cerrar sesion",
//														preferredStyle: .alert)
//				alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
//				self.present(alertController, animated: true, completion: nil)
//			}
//		}
//
//	}
	
}

extension ProfileViewController: ProfileViewProtocol {
	
}
