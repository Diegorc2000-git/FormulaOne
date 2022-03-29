//
//  ProfilePresenter.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 2/3/22.
//

import Foundation
import UIKit

protocol ProfilePresenterProtocol: BasePresenterProtocol {
	func closeSesionPressed()
}

protocol ProfileInteractorOutputProtocol: BaseInteractorOutputProtocol {
	
}

final class ProfilePresenter: BasePresenter {
	
	weak var view: ProfileViewProtocol? { return super.baseView as? ProfileViewProtocol }
	var interactor: ProfileInteractorInputProtocol? { return super.baseInteractor as? ProfileInteractorInputProtocol }
	var router: ProfileRouterProtocol? { return super.baseRouter as? ProfileRouterProtocol }
	
	var viewModel = ProfileViewModel()
	
	func viewDidLoad() {
		
	}
	
}

extension ProfilePresenter: ProfilePresenterProtocol {
	
	func closeSesionPressed() {
		self.router?.closeSesion()
	}
}
