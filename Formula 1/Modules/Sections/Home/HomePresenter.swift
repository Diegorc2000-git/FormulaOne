//
//  HomePresenter.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 1/3/22.
//

import Foundation

protocol HomePresenterProtocol: BasePresenterProtocol {
}

protocol HomeInteractorOutputProtocol: BaseInteractorOutputProtocol {
	
}

final class HomePresenter: BasePresenter {
	
	weak var view: HomeViewProtocol? { return super.baseView as? HomeViewProtocol }
	var interactor: HomeInteractorInputProtocol? { return super.baseInteractor as? HomeInteractorInputProtocol }
	var router: HomeRouterProtocol? { return super.baseRouter as? HomeRouterProtocol }
	
	func viewDidLoad() {
		setupViewModel()
	}
	
	func setupViewModel() {
		
	}
}

extension HomePresenter: HomePresenterProtocol {
	
}
