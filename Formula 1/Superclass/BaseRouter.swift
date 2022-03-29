//
//  BaseRouter.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 2/3/22.
//

import Foundation
import UIKit

class BaseRouter {
	
	enum NavigationType {
		case pushed
		case presented
	}
	
	internal weak var baseView: UIViewController?
	weak var delegate: BaseRouterDelegate?
	
	required init() {}
	
	var navigationType: NavigationType?
	
	// MARK: BaseRouterProtocol
	func cancelFlow() {
		popToRootViewController(animated: true)
	}
	
	func backToPreviousScreen() {
		
		guard let navigationType = navigationType else {
			baseView?.isPresentedAsModal ?? false ? dismiss(animated: true) : popViewController(animated: true)
			return
		}
		
		switch navigationType {
		case .pushed:
			popViewController(animated: true)
		case .presented:
			dismiss(animated: true)
		}
	}
	
	func getNavigationType() -> BaseRouter.NavigationType? {
		return navigationType
	}
	
	// MARK: PRIVATE BASE
	internal func rootViewController(_ viewControllerToPresent: UIViewController, animated flag: Bool) {
		delegate?.navigationDone()
		baseView?.navigationController?.setViewControllers([viewControllerToPresent], animated: flag)
	}

	internal func pushViewController(_ viewControllerToPresent: UIViewController, animated flag: Bool) {
		setNewControllerNavigationType(.pushed, viewController: viewControllerToPresent)
		delegate?.navigationDone()
		baseView?.navigationController?.pushViewController(viewControllerToPresent, animated: flag)
	}

	internal func popViewController(animated: Bool) {
		delegate?.navigationDone()
		baseView?.navigationController?.popViewController(animated: animated)
	}

	internal func popToViewController(toViewController: UIViewController, animated: Bool) {
		delegate?.navigationDone()
		baseView?.navigationController?.popToViewController(toViewController, animated: animated)
	}

	internal func popToRootViewController(animated: Bool) {
		delegate?.navigationDone()
		baseView?.navigationController?.popToRootViewController(animated: animated)
	}

	internal func present(_ viewControllerToPresent: UIViewController,
						  presentationStyle: UIModalPresentationStyle = .fullScreen,
						  animated flag: Bool, completion: (() -> Swift.Void)? = nil) {
		setNewControllerNavigationType(.presented, viewController: viewControllerToPresent)
		delegate?.navigationDone()
		viewControllerToPresent.modalPresentationStyle = presentationStyle
		baseView?.present(viewControllerToPresent, animated: flag, completion: completion)
	}

	internal func dismiss(animated flag: Bool, completion: (() -> Swift.Void)? = nil) {
		delegate?.navigationDone()
		baseView?.dismiss(animated: flag, completion: completion)
	}
	
	func setNewControllerNavigationType(_ type: NavigationType, viewController: UIViewController) {
		guard let view = viewController as? BaseView,
			  let presenter = view.basePresenter as? BasePresenter,
			  let router = presenter.baseRouter as? BaseRouter else { return }
		router.navigationType = type
	}
}
