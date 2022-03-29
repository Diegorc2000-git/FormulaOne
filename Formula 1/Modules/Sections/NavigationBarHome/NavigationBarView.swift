//
//  NavigationBarView.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 2/3/22.
//

import UIKit

protocol CustomNavigationBarDelegate: AnyObject {
	func leftButtonPressed(buttonItemPressed: NavigationBarButtonItem)
	func rightButtonPressed(buttonItemPressed: NavigationBarButtonItem)
	func navigationBackButtonPressed(buttonItemPressed: NavigationBarButtonItem)
}

class NavigationBarView: BaseComponent {

	@IBOutlet weak var leftButton: UIButton!
	@IBOutlet weak var rightButton: UIButton!
	@IBOutlet weak var iconCenter: UIImageView!
	@IBOutlet weak var labelTitle: UILabel!
	
	@IBOutlet weak var iconToBottomSuperviewConstraint: NSLayoutConstraint!
	
	weak var delegate: CustomNavigationBarDelegate?
	var viewModel: NavigationBarModel?
	
	override func layoutSubviews() {
		super.layoutSubviews()
		setup()
	}
	
	override func setup() {
		super.setup()
		guard let viewModel = viewModel else { return }
		
		switch viewModel.type {
		case .customNormal:
			self.configureCustomNavBar(viewModel: viewModel)
			
		case .customLarge:
			
			self.configureLargeNavBar(viewModel: viewModel)
			
		default:
			break
		}
		self.layoutIfNeeded()
	}
	func configure(viewModel: NavigationBarModel) {
		self.viewModel = viewModel
		self.setup()
	}

	private func configureCustomNavBar(viewModel: NavigationBarModel) {
		if viewModel.title == nil {
			self.iconToBottomSuperviewConstraint.isActive = true
		
		} else {
			self.iconToBottomSuperviewConstraint.isActive = false
		}
	   
		leftButton.isHidden = false
		if let arrayLeftButton = viewModel.arrayLeftButtons {
			leftButton.setImage(arrayLeftButton.first?.image, for: .normal)
			
		}
		rightButton.isHidden = false
		if let arrayRightButton = viewModel.arrayRightButtons {
			rightButton.setImage(arrayRightButton.first?.image, for: .normal)
		}
		
		iconCenter.isHidden = false
		iconCenter.image = viewModel.iconCenter
		labelTitle.isHidden = true
		
	}
	
	private func configureLargeNavBar(viewModel: NavigationBarModel) {
		
		leftButton.isHidden = false
		if let arrayLeftButton = viewModel.arrayLeftButtons {
			leftButton.setImage(arrayLeftButton.first?.image, for: .normal)
			//leftButton.tintColor = CustomColor.
		}
		rightButton.isHidden = false
		
		//rightButton.tintColor = .navyBlue
		if let arrayRightButton = viewModel.arrayRightButtons {
			rightButton.setImage(arrayRightButton.first?.image, for: .normal)
			if let buttonText = arrayRightButton.first?.text {
				rightButton.setTitle(buttonText, for: .normal)
			} else {
				rightButton.setTitle(LocalizedKeys.Generic.buttonCancel.uppercased(), for: .normal)
			}
			
			//rightButton.tintColor = .navyBlue
		}
		
		iconCenter.isHidden = true
		if let img = viewModel.iconCenter {
			iconCenter.image = img
			iconCenter.isHidden = false
		}
		
		labelTitle.isHidden = false
		labelTitle.text = viewModel.title
		labelTitle.font = UIFont(name: "Cartero-Regular", size: 24)
		labelTitle.textColor = CustomColor.textHighlighted.uiColor
		self.labelTitle.text = viewModel.title
	}
	
//	@IBAction func rightButtonPressed(_ sender: Any) {
//		if let arrayRightButtons = viewModel?.arrayRightButtons {
//			self.delegate?.rightButtonPressed(buttonItemPressed: arrayRightButtons.first ?? .cancelButton)
//		}
//	}
//
//	@IBAction func leftButtonPressed(_ sender: Any) {
//
//		if let arrayLeftButtons = viewModel?.arrayLeftButtons {
//			self.delegate?.leftButtonPressed(buttonItemPressed: arrayLeftButtons.first ?? .backArrow)
//		}
//		if let backNavigation = viewModel?.backButton {
//			self.delegate?.navigationBackButtonPressed(buttonItemPressed: backNavigation)
//		}
//
//	}
}
