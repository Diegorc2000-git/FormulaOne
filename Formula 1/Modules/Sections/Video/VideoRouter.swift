//
//  VideoRouter.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 1/3/22.
//

import Foundation

protocol VideoRouterProtocol {
	
}

final class VideoRouter {
	
	let vc: VideoViewController?
	
	init(vc: VideoViewController) {
		self.vc = vc
	}
	
}

extension VideoRouter: VideoRouterProtocol {
	
}
