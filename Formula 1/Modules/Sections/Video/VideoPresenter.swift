//
//  VideoPresenter.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 1/3/22.
//

import Foundation
import UIKit

protocol VideoPresenterProtocol {
	
}

final class VideoPresenter {
	
	let vc: VideoViewController?
	var router: VideoRouterProtocol?
	
	init(vc: VideoViewController) {
		self.vc = vc
	}
	
}

extension VideoPresenter: VideoPresenterProtocol {
	
}
