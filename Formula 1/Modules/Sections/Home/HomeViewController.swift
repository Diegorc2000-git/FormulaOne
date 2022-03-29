//
//  HomeViewController.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 1/3/22.
//

import UIKit

protocol HomeViewProtocol: BaseViewProtocol {

}

class HomeViewController: BaseView {

	@IBOutlet weak var navigationBar: UIView!
	@IBOutlet weak var iconNavBar: UIImageView!
	
	private var presenter: HomePresenterProtocol? { return super.basePresenter as? HomePresenterProtocol }
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.setupView()
    }
	
	func setupView() {
		self.navigationBar.backgroundColor = CustomColor.viewPrimary.uiColor
		self.iconNavBar.image = UIImage(named: ImageAndIconConstants.logoApp)
	}

}

extension HomeViewController: HomeViewProtocol {
	
}
