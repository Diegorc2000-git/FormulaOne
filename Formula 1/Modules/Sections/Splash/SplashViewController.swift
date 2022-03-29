//
//  SplashViewController.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 17/3/22.
//

import UIKit
import Lottie

protocol SplashViewProtocol: BaseViewProtocol {

}

class SplashViewController: BaseView {
	
	private var presenter: SplashPresenterProtocol? { return super.basePresenter as? SplashPresenterProtocol }
	
	@IBOutlet weak var logoAppView: UIImageView!
	@IBOutlet weak var genericView: UIView!
	@IBOutlet weak var lottieView: AnimationView!
	@IBOutlet weak var subView: UIView!
	@IBOutlet weak var labelCreation: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
	}
	
	func setupView() {
		self.logoAppView.image = UIImage(named: ImageAndIconConstants.logoApp)
		self.genericView.backgroundColor = CustomColor.viewSecondary.uiColor
		self.subView.backgroundColor = CustomColor.viewSecondary.uiColor
		self.labelCreation.text = LocalizedKeys.Splash.splashCreatorText
		self.labelCreation.textColor = CustomColor.textLight.uiColor
		self.lottieView.backgroundColor = .clear
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		lottieView.center = view.center
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
			self.animate()
		})
	}

	private func animate() {
		UIView.animate(withDuration: 1, animations: {
			self.lottieView?.loopMode = .loop
			self.lottieView?.animationSpeed = 3
			self.lottieView?.play()
		}, completion: { done in
			if done {
				DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
					self.presenter?.navigateToHome()
				})
			}
		})
		
	}
}

extension SplashViewController: SplashViewProtocol {
	
}
