//
//  UIViewController+Extension.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 2/3/22.
//

import Foundation
import UIKit

enum Storyboards: String {
	case main = "Main"
	var storyboard: UIStoryboard {
		return UIStoryboard(name: rawValue, bundle: nil)
	}
}

extension UIViewController {
	
	var isPresentedAsModal: Bool {
		
		let presentingIsModal = presentingViewController != nil
		let presentingIsNavigation = navigationController?.presentingViewController?.presentedViewController == navigationController
		let presentingIsTabBar = tabBarController?.presentingViewController is UITabBarController
		
		return presentingIsModal || presentingIsNavigation || presentingIsTabBar
	}
	
}
