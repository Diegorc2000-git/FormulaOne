//
//  StyleGuides.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 29/3/22.
//

import Foundation
import UIKit

extension UIButton {
	
	func primaryRounded() {
		
		self.backgroundColor = CustomColor.viewPrimary.uiColor
		self.layer.cornerRadius = 22
	}
	
	func secondaryRounded() {
		
		self.backgroundColor = CustomColor.viewGeneralBackground.uiColor
		self.layer.borderColor = CustomColor.textNormal.uiColor.cgColor
		self.layer.cornerRadius = 22
		self.layer.borderWidth = 2
	}
}

extension UIView {

	func roundedByDefault(radious: CGFloat? = nil,
						  background: UIColor? = nil,
						  borderWith: CGFloat = 0,
						  borderColor: UIColor? = nil) {
		
		let radious = radious == nil ? self.frame.height / 2 : radious!
		self.layer.cornerRadius = radious
		
		if let background = background {
			self.backgroundColor = background
		}
		self.layer.borderWidth = borderWith
		self.layer.borderColor = borderColor?.cgColor
		
		self.clipsToBounds = true
	}
}

extension UIButton {
	func setBackgroundColor(color: UIColor, forState: UIControl.State) {
		clipsToBounds = true // add this to maintain corner radius
		UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
		if let context = UIGraphicsGetCurrentContext() {
			context.setFillColor(color.cgColor)
			context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
			let colorImage = UIGraphicsGetImageFromCurrentImageContext()
			UIGraphicsEndImageContext()
			setBackgroundImage(colorImage, for: forState)
		}
	}
	
	func showBorder(borderWidth: CGFloat, borderColor: UIColor) {
		self.layer.borderWidth = borderWidth
		self.layer.borderColor = borderColor.cgColor
	}
	
	func setEnabled(_ isEnabled: Bool) {
		self.alpha = isEnabled ? 1 : 0.5
		self.isEnabled = isEnabled
	}
}
