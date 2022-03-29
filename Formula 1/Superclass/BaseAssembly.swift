//
//  BaseAssembly.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 2/3/22.
//

import Foundation
import UIKit

// swiftlint:disable large_tuple

class BaseAssembly {
	static func assembly<View: BaseView,
						 Presenter: BasePresenter,
						 Router: BaseRouter,
						 Interactor: BaseInteractor>(baseView: View,
													 presenter: Presenter.Type,
													 router: Router.Type,
													 interactor: Interactor.Type)
	-> (view: View, presenter: Presenter, interactor: Interactor, router: Router) {
		let basePresenter = Presenter()
		let baseRouter = Router()
		let baseInteractor = Interactor()
		
		baseView.basePresenter = basePresenter as? BasePresenterProtocol
		
		basePresenter.baseView = baseView as? BaseViewProtocol
		basePresenter.baseRouter = baseRouter as? BaseRouterProtocol
		basePresenter.baseInteractor = baseInteractor as? BaseInteractorInputProtocol
		
		baseRouter.baseView = baseView
//		baseRouter.delegate = basePresenter
		
		baseInteractor.basePresenter = basePresenter as? BaseInteractorOutputProtocol
		
		return (baseView, basePresenter, baseInteractor, baseRouter)
	}
}
