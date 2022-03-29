//
//  VideoAssembly.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 1/3/22.
//

import Foundation
import UIKit

final class VideoAssembly {
	
	static func navigation() -> UINavigationController {
		UINavigationController(rootViewController: view())
	}
	
	static func view() -> VideoViewController {
		let vc = VideoViewController()
		vc.presenter = presenter(vc: vc)
		return vc
	}
	
	static func presenter(vc: VideoViewController) -> VideoPresenterProtocol {
		let presenter = VideoPresenter(vc: vc)
		presenter.router = router(vc: vc)
		return presenter
	}
	
	static func router(vc: VideoViewController) -> VideoRouterProtocol {
		let router = VideoRouter(vc: vc)
		return router
	}
}
