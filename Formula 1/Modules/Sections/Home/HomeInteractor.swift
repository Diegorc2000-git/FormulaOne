//
//  HomeInteractor.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 2/3/22.
//

import Foundation

protocol HomeInteractorInputProtocol: BaseInteractorInputProtocol {
	
}

class HomeInteractor: BaseInteractor {
	
	private var presenter: HomeInteractorOutputProtocol? { return super.basePresenter as? HomeInteractorOutputProtocol }
	
}

extension HomeInteractor: HomeInteractorInputProtocol {
	
}
