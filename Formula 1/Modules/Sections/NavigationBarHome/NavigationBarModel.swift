//
//  NavigationBarModel.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 2/3/22.
//

import Foundation
import UIKit

class NavigationBarModel {
	
	enum BarType {
		case native
		case customLarge
		case customNormal
	}
	
	var type = BarType.native
	var title: String?
	var backButton: NavigationBarButtonItem?
	var arrayLeftButtons: [NavigationBarButtonItem]?
	var arrayRightButtons: [NavigationBarButtonItem]?
	var titleView: UIView?
	var backgroundImage: UIImage?
	var iconCenter: UIImage?
	var backGroundColor: UIColor?
	var isTransparent = false
	var verticalSpacingMainSubviewAndNavigationBar: Float = 0
	
	init(type: BarType = .native,
		 title: String? = nil,
		 backButton: NavigationBarButtonItem? = nil,
		 arrayLeftButtons: [NavigationBarButtonItem]? = nil,
		 arrayRightButtons: [NavigationBarButtonItem]? = nil,
		 titleView: UIView? = nil,
		 backgroundImage: UIImage? = nil,
		 iconCenter: UIImage? = nil,
		 backGroundColor: UIColor? = nil,
		 isTransparent: Bool = false,
		 verticalSpacingMainSubviewAndNavigationBar: Float = 0) {
		
		self.type = type
		self.title = title
		self.backButton = backButton
		self.arrayLeftButtons = arrayLeftButtons
		self.arrayRightButtons = arrayRightButtons
		self.titleView = titleView
		self.backgroundImage = backgroundImage
		self.iconCenter = iconCenter
		self.backGroundColor = backGroundColor
		self.isTransparent = isTransparent
		self.verticalSpacingMainSubviewAndNavigationBar = verticalSpacingMainSubviewAndNavigationBar
	}
	
}

class NavigationBarButtonItem {

	private var icon: UIImage?
	private var color: CustomColor?
	var text: String?
	var isEnabled = true
	var type: NavigationButtonType
	var resourceType: ResourceType
	
	var uiBarButtonItem: UIBarButtonItem?
	var handler: ((NavigationBarButtonItem) -> Void)?
	
	enum ResourceType {
		case image
		case freeText
	}
	
	enum NavigationButtonType {
		case back
		case information
		case edit
		case share
		case logout
	}
	
	init(type: NavigationButtonType, icon: UIImage, isEnabled: Bool = true) {
		self.resourceType = .image
		self.type = type
		self.icon = icon
		self.isEnabled = isEnabled
	}
	
	init(type: NavigationButtonType, text: String, color: CustomColor = .textHighlighted, isEnabled: Bool = true) {
		self.resourceType = .freeText
		self.type = type
		self.text = text
		self.color = color
		self.isEnabled = isEnabled
	}
	
	var image: UIImage? {
		return self.icon?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
	}
	
	@objc func navigationBarButtonItemPressed(sender: UIBarButtonItem) {
		self.handler?(self)
	}
	
	func initUIButtonItem() {
		
		if self.resourceType == .image {
			
			self.uiBarButtonItem = UIBarButtonItem(image: self.image,
												   style: .plain,
												   target: self,
												   action: #selector(navigationBarButtonItemPressed(sender:)))
		} else {
			
			self.uiBarButtonItem = UIBarButtonItem(
				title: self.text,
				style: .plain,
				target: self,
				action: #selector(navigationBarButtonItemPressed(sender:)))
			self.uiBarButtonItem?.tintColor = self.color?.uiColor
		}
		
		self.uiBarButtonItem?.isEnabled = self.isEnabled
	}
	
	static func transformNavigationItemsToUI(arrayNavigationBarButtonItems: [NavigationBarButtonItem], handler: @escaping (NavigationBarButtonItem) -> Void) -> [UIBarButtonItem] {
		return arrayNavigationBarButtonItems.map { rightButtonItem -> UIBarButtonItem? in
			
			rightButtonItem.handler = handler
			rightButtonItem.initUIButtonItem()
			
			return rightButtonItem.uiBarButtonItem
		}.compactMap({ $0 })
	}
}

extension NavigationBarButtonItem {
	
	static var backArrow = NavigationBarButtonItem(type: .back,
												   icon: UIImage(named: ImageAndIconConstants.back) ?? UIImage(),
												   isEnabled: true)
	static var share = NavigationBarButtonItem(type: .share,
												   icon: UIImage(named: ImageAndIconConstants.share) ?? UIImage(),
												   isEnabled: true)
	static var edit = NavigationBarButtonItem(type: .edit,
												   icon: UIImage(named: ImageAndIconConstants.edit) ?? UIImage(),
												   isEnabled: true)
	static var logOut = NavigationBarButtonItem(type: .logout,
												   icon: UIImage(named: ImageAndIconConstants.logOut) ?? UIImage(),
												   isEnabled: true)
	static var information = NavigationBarButtonItem(type: .information,
												   icon: UIImage(named: ImageAndIconConstants.logOut) ?? UIImage(),
												   isEnabled: true)
}
