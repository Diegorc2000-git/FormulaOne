//
//  AppDelegate.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 1/3/22.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	let appAssembly: AppAssemblyProtocol = AppAssembly()
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		window = UIWindow(frame: UIScreen.main.bounds)
		if let windowDes = window {
			appAssembly.showInitialApp(window: windowDes)
		}
		FirebaseApp.configure()
		return true
	}

}
