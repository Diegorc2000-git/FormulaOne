//
//  CustomColor.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 2/3/22.
//

import Foundation
import UIKit

enum CustomColor: String {
	
	case textError
	case textHighlighted
	case textIcons
	case textLight
	case textMessages
	case textNormal
	case textPlaceholder
	case textSecondary
	case textSuccess
	
	case viewCancelAction
	case viewContainer
	case viewError
	case viewGeneralBackground
	case viewIntermediary
	case viewPrimary
	case viewSecondary
	case viewSeparator
	case viewSuccess
	case viewWarning
	case viewSecondaryInformation
	case iconPrimaryTint
	case iconSecondaryTint
	case buttonIconTintColorPrimary
	case buttonTextPrimaryTextColor
}

extension CustomColor {
	var uiColor: UIColor {
		
		var color: UIColor
		
		switch self {
		case .textError:
			color = #colorLiteral(red: 0.9333333333, green: 0, blue: 0, alpha: 1)
		case .textHighlighted:
			color = #colorLiteral(red: 0.08235294118, green: 0.08235294118, blue: 0.1176470588, alpha: 1)
		case .textIcons:
			color = #colorLiteral(red: 0.9254901961, green: 0, blue: 0.1333333333, alpha: 1)
		case .textLight:
			color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		case .textMessages:
			color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
		case .textNormal:
			color = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
		case .textPlaceholder:
			color = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
		case .textSecondary:
			color = #colorLiteral(red: 0.400000006, green: 0.400000006, blue: 0.400000006, alpha: 1)
		case .textSuccess:
			color = #colorLiteral(red: 0.2039215686, green: 0.7490196078, blue: 0.2549019608, alpha: 1)
			
		case .viewCancelAction:
			color = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
		case .viewContainer:
			color = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
		case .viewError:
			color = #colorLiteral(red: 0.9333333333, green: 0, blue: 0, alpha: 1)
		case .viewGeneralBackground:
			color = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
		case .viewIntermediary:
			color = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
		case .viewPrimary:
			color = #colorLiteral(red: 0.9333333333, green: 0, blue: 0, alpha: 1)
		case .viewSecondary:
			color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
		case .viewSeparator:
			color = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
		case .viewSuccess:
			color = #colorLiteral(red: 0.2039215686, green: 0.7490196078, blue: 0.2549019608, alpha: 1)
		case .viewWarning:
			color = #colorLiteral(red: 0.9843137255, green: 0.5254901961, blue: 0.007843137255, alpha: 1)
		case .viewSecondaryInformation:
			color = #colorLiteral(red: 0.7647058824, green: 0.8941176471, blue: 0.9215686275, alpha: 1)
		case .buttonIconTintColorPrimary:
			color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		case .buttonTextPrimaryTextColor:
			color = #colorLiteral(red: 0.9333333333, green: 0, blue: 0, alpha: 1)
		case .iconPrimaryTint:
			color = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
		case .iconSecondaryTint:
			color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
		}
		
		if #available(iOS 11.0, *) {
			return UIColor(named: self.rawValue.capitalized) ?? color
		} else {
			return color
		}
	}
}
