//
//  UIView+Extension.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 2/3/22.
//

import Foundation
import UIKit

extension UIView {
	func addSubviewWithConstraints(_ insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), subView: UIView, at index: Int? = nil) {
		
		if let index = index {
			insertSubview(subView, at: index)
		} else {
			addSubview(subView)
		}
		subView.translatesAutoresizingMaskIntoConstraints = false

		addConstraint(NSLayoutConstraint(item: subView,
										 attribute: .top,
										 relatedBy: .equal,
										 toItem: self,
										 attribute: .top,
										 multiplier: 1.0,
										 constant: insets.top))

		addConstraint(NSLayoutConstraint(item: subView,
										 attribute: .trailing,
										 relatedBy: .equal,
										 toItem: self,
										 attribute: .trailing,
										 multiplier: 1.0,
										 constant: insets.right))

		addConstraint(NSLayoutConstraint(item: subView,
										 attribute: .bottom,
										 relatedBy: .equal,
										 toItem: self,
										 attribute: .bottom,
										 multiplier: 1.0,
										 constant: insets.bottom))

		addConstraint(NSLayoutConstraint(item: subView,
										 attribute: .leading,
										 relatedBy: .equal,
										 toItem: self,
										 attribute: .leading,
										 multiplier: 1.0,
										 constant: insets.left))

		subView.layoutIfNeeded()
	}

	func addSubviewWithConstraints(left: CGFloat, right: CGFloat, top: CGFloat, subView: UIView) -> (leftConstraint: NSLayoutConstraint, rightConstraint: NSLayoutConstraint, topConstraint: NSLayoutConstraint) {
		addSubview(subView)
		subView.translatesAutoresizingMaskIntoConstraints = false

		let left = NSLayoutConstraint(item: subView,
									  attribute: .leading,
									  relatedBy: .equal,
									  toItem: self,
									  attribute: .leading,
									  multiplier: 1.0,
									  constant: left)
		let right = NSLayoutConstraint(item: subView,
									   attribute: .trailing,
									   relatedBy: .equal,
									   toItem: self,
									   attribute: .trailing,
									   multiplier: 1.0,
									   constant: right)
		let top = NSLayoutConstraint(item: subView,
										attribute: .top,
										relatedBy: .equal,
										toItem: self,
										attribute: .top,
										multiplier: 1.0,
										constant: top)

		addConstraint(right)
		addConstraint(top)
		addConstraint(left)

		subView.layoutIfNeeded()

		return (left, right, top)
	}
}
