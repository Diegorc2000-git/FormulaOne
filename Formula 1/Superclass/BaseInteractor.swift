//
//  BaseInteractor.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 2/3/22.
//

import Foundation
import UIKit

class BaseInteractor: NSObject, BaseProviderDelegate {
	
	internal weak var basePresenter: BaseInteractorOutputProtocol?
	
	required override init() {}
	
}
