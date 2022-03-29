//
//  StandingPresenter.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 2/3/22.
//

import Foundation
import UIKit

protocol StandingPresenterProtocol {
	
}

final class StandingPresenter {
	
	let vc: StandingViewController?
	var router: StandingRouterProtocol?
	
	init(vc: StandingViewController) {
		self.vc = vc
	}
	
}

extension StandingPresenter: StandingPresenterProtocol {
	
}
