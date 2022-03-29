//
//  TabBarHomeAssembly.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 1/3/22.
//

import Foundation
import UIKit

class TabBarHomeAssembly {
	
	static func view() -> UITabBarController {
		let tabBarViewController = TabBarHomeViewController()
	
		let homeVc = HomeAssembly.navigationController()
		let homeButton = UITabBarItem(
			title: LocalizedKeys.TabBar.latest,
			image: UIImage(named: ImageAndIconConstants.latest)?.withRenderingMode(.alwaysOriginal),
			selectedImage: UIImage(named: ImageAndIconConstants.latest)?.withRenderingMode(.alwaysTemplate))
		
		homeVc.tabBarItem = homeButton
		
		let videoVc = VideoAssembly.navigation()
		let videoButton = UITabBarItem(
			title: LocalizedKeys.TabBar.video,
			image: UIImage(named: ImageAndIconConstants.video)?.withRenderingMode(.alwaysOriginal),
			selectedImage: UIImage(named: ImageAndIconConstants.video)?.withRenderingMode(.alwaysTemplate))
		
		videoVc.tabBarItem = videoButton
		
		let racingVc = RacingAssembly.navigation()
		let racingButton = UITabBarItem(title: LocalizedKeys.TabBar.racing,
										image: UIImage(named: ImageAndIconConstants.racing)?.withRenderingMode(.alwaysOriginal),
										selectedImage: UIImage(named: ImageAndIconConstants.racing)?.withRenderingMode(.alwaysTemplate))

		racingVc.tabBarItem = racingButton
		
		let standingVc = StandingAssembly.navigation()
		let standingButton = UITabBarItem(title: LocalizedKeys.TabBar.standing,
										image: UIImage(named: ImageAndIconConstants.standing)?.withRenderingMode(.alwaysOriginal),
										selectedImage: UIImage(named: ImageAndIconConstants.standing)?.withRenderingMode(.alwaysTemplate))

		standingVc.tabBarItem = standingButton
		
		let profileVc = ProfileAssembly.navigationController()
		let profileButton = UITabBarItem(title: LocalizedKeys.TabBar.profile,
										image: UIImage(named: ImageAndIconConstants.profile)?.withRenderingMode(.alwaysOriginal),
										selectedImage: UIImage(named: ImageAndIconConstants.profile)?.withRenderingMode(.alwaysTemplate))

		profileVc.tabBarItem = profileButton
		
		tabBarViewController.viewControllers = [homeVc, videoVc, racingVc, standingVc, profileVc]
		
		return tabBarViewController
	}
}
