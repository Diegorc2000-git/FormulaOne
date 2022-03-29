//
//  RacingPresenter.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 2/3/22.
//

import Foundation
import UIKit

protocol RacingPresenterProtocol {
	
}

final class RacingPresenter {
	
	let vc: RacingViewController?
	var router: RacingRouterProtocol?
	
	init(vc: RacingViewController) {
		self.vc = vc
	}
	
}

extension RacingPresenter: RacingPresenterProtocol {
	
}
