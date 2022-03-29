//
//  NavigationBarManager.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 2/3/22.
//

import Foundation
import UIKit

protocol NavigationBarManagerDelegate: AnyObject {
	func navigationBarLeftButtonItemPressed(buttonItem: NavigationBarButtonItem)
	func navigationBarRightButtonItemPressed(buttonItem: NavigationBarButtonItem)
	func backNavigationBarButtonPressed()
}

class NavigationBarManager {
	
	weak var viewController: UIViewController?
	weak var delegate: NavigationBarManagerDelegate?
	var customNavigationBar: NavigationBarView?
	var model: NavigationBarModel?
	
	var constraintTopMainViewToScreen: NSLayoutConstraint?
	var constraintTopMainViewToNavigationBar: NSLayoutConstraint?
	
	var isHidden: Bool = true {
		didSet {
			
			guard let type = model?.type else { return }
			
			switch type {
			case .native:
				self.navigationController?.setNavigationBarHidden(isHidden, animated: true)
			case .customLarge, .customNormal:
				self.customNavigationBar?.isHidden = isHidden
			}
		}
	}
	var navigationController: UINavigationController? {
		return self.viewController?.navigationController
	}
	var navigationItem: UINavigationItem? {
		return self.viewController?.navigationItem
	}
	var title: String? {
		get {
			return self.viewController?.title
		}
		set {
			self.viewController?.title = newValue
		}
	}
	
	private var arrayRightButtons: [NavigationBarButtonItem]?
	private var arrayLeftButtons: [NavigationBarButtonItem]?
	
	init(viewController: UIViewController) {
		self.viewController = viewController
		self.delegate = viewController as? NavigationBarManagerDelegate
	}
	
	func setNavigationBar(backgroundImage: UIImage? = nil, backgroundColor: UIColor? = nil) {
		let navBar = self.navigationController?.navigationBar
		let titleTextAttributes = [NSAttributedString.Key.foregroundColor: CustomColor.textNormal.uiColor]
		
		if #available(iOS 13.0, *) {
			let appearance = UINavigationBarAppearance()
			navBar?.isTranslucent = false
			appearance.backgroundImage = backgroundImage
			appearance.backgroundColor = backgroundColor
			appearance.titleTextAttributes = titleTextAttributes
			appearance.shadowColor = .clear
		
			navBar?.standardAppearance = appearance
			navBar?.compactAppearance = appearance
			navBar?.scrollEdgeAppearance = appearance
		} else {
			navBar?.isTranslucent = false
			navBar?.barTintColor = backgroundColor
			navBar?.titleTextAttributes = titleTextAttributes
			navBar?.setBackgroundImage(backgroundImage, for: UIBarMetrics.default)
			navBar?.shadowImage = UIImage()
		}

	}
	
	func setNavigationBarTitleView(view: UIView?) {
		
		self.navigationItem?.titleView = view
		
	}
	
	func setNavigationBarLeftButtonItems(arrayLeftButtons: [NavigationBarButtonItem]) {
		
		self.arrayLeftButtons = arrayLeftButtons
		
		self.navigationItem?.leftBarButtonItems = NavigationBarButtonItem.transformNavigationItemsToUI(
			arrayNavigationBarButtonItems: arrayLeftButtons,
			handler: self.navigationBarLeftButtonItemPressed(_:))
	}
	
	func setNavigationBarRightButtonItems(arrayRightButtons: [NavigationBarButtonItem]) {
		
		self.arrayRightButtons = arrayRightButtons
		
		self.navigationItem?.rightBarButtonItems = NavigationBarButtonItem.transformNavigationItemsToUI(
			arrayNavigationBarButtonItems: arrayRightButtons,
			handler: self.navigationBarRightButtonItemPressed(_:))
	}
	
	func setNavigationBarBackButton(backButton: NavigationBarButtonItem) {
		let navBar = self.navigationController?.navigationBar
		navBar?.backIndicatorImage = backButton.image
		navBar?.backIndicatorTransitionMaskImage = backButton.image
		self.navigationItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
	}
	func setTransparent(isTransparent: Bool) {
		
		if isTransparent {
			navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
			navigationController?.navigationBar.shadowImage = UIImage()
			navigationController?.navigationBar.isTranslucent = true
		}
	}
	
	func getFrame() -> CGRect {
		
		guard let frame = self.navigationController?.navigationBar.frame else { return CGRect(x: 0, y: 0, width: 0, height: 0)}
		return frame
	}
	
	func configureCustomNavigationBar(model: NavigationBarModel) {
		
		self.model = model
		
		if model.type == .native {
			isHidden = false
	
			self.configureNativeNavBar(model: model)
			
		} else {
			self.configureCustomNavBar(model: model)
		}
	}
	
	private func configureNativeNavBar(model: NavigationBarModel) {
		if let backButton = model.backButton { self.setNavigationBarBackButton(backButton: backButton) }
		if let arrayLeftButtons = model.arrayLeftButtons { self.setNavigationBarLeftButtonItems(arrayLeftButtons: arrayLeftButtons) }
		if let arrayRightButtons = model.arrayRightButtons { self.setNavigationBarRightButtonItems(arrayRightButtons: arrayRightButtons) }
		if let titleView = model.titleView { self.setNavigationBarTitleView(view: titleView) }
		self.setNavigationBar(backgroundImage: model.backgroundImage ?? UIImage(named: "default"), backgroundColor: model.backGroundColor)
		if model.isTransparent { self.setTransparent(isTransparent: model.isTransparent) }
		if let title = model.title { self.title = title }
	}
	
	private func configureCustomNavBar(model: NavigationBarModel) {
		guard let viewNavBar = customNavigationBar ?? createNavBar(model: model) else { return }
		isHidden = false
		self.customNavigationBar = viewNavBar
		self.customNavigationBar?.delegate = self
		
		self.customNavigationBar?.configure(viewModel: model)
		self.customNavigationBar?.isHidden = isHidden
	}
	
	func createNavBar(model: NavigationBarModel) -> NavigationBarView? {
		let navBar = NavigationBarView()
		self.setNavBarInScreen(navBar: navBar, verticalSpacing: model.verticalSpacingMainSubviewAndNavigationBar)
		return navBar
	}
	
	func setNavBarInScreen(navBar: NavigationBarView, verticalSpacing: Float) {
		
		guard let mainView = viewController?.view else { return }
		
		guard let mainSubview = mainView.subviews.first else { return }
		//constraintTopMainViewToScreen = mainSubview.findConstraint(layoutAttribute: .top)
		constraintTopMainViewToScreen?.isActive = false

		mainView.insertSubview(navBar, at: 0)
		
		navBar.translatesAutoresizingMaskIntoConstraints = false
		
		mainView.addConstraint(NSLayoutConstraint(item: navBar,
												  attribute: .top,
												  relatedBy: .equal,
												  toItem: mainView,
												  attribute: .top,
												  multiplier: 1.0,
												  constant: 0))
		
		constraintTopMainViewToNavigationBar = NSLayoutConstraint(item: navBar,
																  attribute: .bottom,
																  relatedBy: .equal,
																  toItem: mainSubview,
																  attribute: .top,
																  multiplier: 1.0,
																  constant: CGFloat(verticalSpacing))
		
		if let constraintTopMainViewToNavigationBar = constraintTopMainViewToNavigationBar {
			mainView.addConstraint(constraintTopMainViewToNavigationBar)
		}
		
		mainView.addConstraint(NSLayoutConstraint(item: navBar,
												  attribute: .trailing,
												  relatedBy: .equal,
												  toItem: mainView,
												  attribute: .trailing,
												  multiplier: 1.0,
												  constant: 0))
		
		mainView.addConstraint(NSLayoutConstraint(item: navBar,
												  attribute: .leading,
												  relatedBy: .equal,
												  toItem: mainView,
												  attribute: .leading,
												  multiplier: 1.0,
												  constant: 0))
		
		navBar.layoutIfNeeded()
	}
	
	func navigationBarLeftButtonItemPressed(_ buttonItem: NavigationBarButtonItem) {
		self.delegate?.navigationBarLeftButtonItemPressed(buttonItem: buttonItem)
	}
	
	func navigationBarRightButtonItemPressed(_ buttonItem: NavigationBarButtonItem) {
		self.delegate?.navigationBarRightButtonItemPressed(buttonItem: buttonItem)
	}
}

extension NavigationBarManager: CustomNavigationBarDelegate {
	func leftButtonPressed(buttonItemPressed: NavigationBarButtonItem) {
		
		self.delegate?.navigationBarLeftButtonItemPressed(buttonItem: buttonItemPressed)
		
	}
	
	func rightButtonPressed(buttonItemPressed: NavigationBarButtonItem) {
		self.delegate?.navigationBarRightButtonItemPressed(buttonItem: buttonItemPressed)
	}
	
	func navigationBackButtonPressed(buttonItemPressed: NavigationBarButtonItem) {
		self.delegate?.backNavigationBarButtonPressed()
	}
	
}
