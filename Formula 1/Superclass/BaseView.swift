//
//  BaseView.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 2/3/22.
//

import Foundation
import UIKit

class BaseView: UIViewController, NavigationBarManagerDelegate {
	
	internal var basePresenter: BasePresenterProtocol?
	
	func navigationBarLeftButtonItemPressed(buttonItem: NavigationBarButtonItem) {}
	
	func navigationBarRightButtonItemPressed(buttonItem: NavigationBarButtonItem) {}
	
	func backNavigationBarButtonPressed() {
		basePresenter?.backNavigationBarButtonPressed()
	}
	
	var navigationBarManager: NavigationBarManager?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if #available(iOS 13.0, *) {
			overrideUserInterfaceStyle = .light
		} else {
			// Fallback on earlier versions
		}
		
		self.navigationBarManager = NavigationBarManager(viewController: self)
		self.navigationBarManager?.delegate = self
		
		self.navigationBarManager?.configureCustomNavigationBar(model: NavigationBarModel(backButton: .backArrow, backGroundColor: CustomColor.viewPrimary.uiColor))
		navigationBarManager?.isHidden = true
		
		basePresenter?.viewDidLoad()
	}
}

extension BaseView {
	public func navigateToViewController(viewController: UIViewController, animated: Bool) {
		navigationController?.pushViewController(viewController, animated: animated)
	}

	public func presentViewControllerModally(viewController: UIViewController, animated: Bool) {
		modalPresentationStyle = .overFullScreen
		present(viewController, animated: true, completion: nil)
	}
}
