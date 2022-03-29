//
//  CustomFont.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 29/3/22.
//

import Foundation
import UIKit

struct CustomFont {
	
	var fontType: FontType
	var size: Size
	var style: Style
	
	init(fontType: FontType,
		 size: Size = .medium,
		 style: Style = .regular) {
		
		self.fontType = fontType
		self.size = size
		self.style = style
	}
}

extension CustomFont {
	
	enum FontType {
		case system
	}
	
	enum Size: CGFloat {
		case XXS = 8
		case XS = 10
		case small = 12
		case medium = 14
		case large = 16
		case larger = 18
		case XL = 20
		case XXL = 24
		case XXXL = 30
	}
	
	enum Style {
		case regular
		case bold
		case light
	}
}

extension CustomFont {
	
	var uiFont: UIFont {
		
		var name = ""
		
		switch self.fontType {
		case .system:
			switch self.style {
			case .regular:
				name = "Cartero-Regular"
			case .bold:
				name = "Cartero-Bold"
			case .light:
				name = "Cartero-Light"
			}
			
			return UIFont(name: name, size: self.size.rawValue) ?? UIFont.systemFont(ofSize: self.size.rawValue)
		}
	}
}
