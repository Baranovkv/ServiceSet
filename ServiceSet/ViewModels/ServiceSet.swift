//
//  ServiceSet.swift
//  ServiceSet
//
//  Created by Kirill Baranov on 30/03/24.
//

import Foundation
import Observation

@Observable
class ServiceSet {
	
	var set: [Service]?
	var responceError: APIErrors?
	
	var loadingState: LoadingStates = .loading
	
	func loadServices() {
		APIManager().loadServices { result in
			switch result {
			case .success(let responce):
				self.set = responce.body.services
				self.loadingState = .loaded
			case .failure(let error):
				self.responceError = error
				self.loadingState = .failed
			}
		}
	}
}

enum LoadingStates {
	case loading, loaded, failed
}
