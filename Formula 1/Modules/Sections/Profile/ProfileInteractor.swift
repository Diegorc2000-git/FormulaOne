//
//  ProfileInteractor.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 28/3/22.
//

import Foundation

protocol ProfileInteractorInputProtocol: BaseInteractorInputProtocol {
	
}

class ProfileInteractor: BaseInteractor {
	
	private var presenter: ProfileInteractorOutputProtocol? { return super.basePresenter as? ProfileInteractorOutputProtocol }
	
}

extension ProfileInteractor: ProfileInteractorInputProtocol {
	
}
