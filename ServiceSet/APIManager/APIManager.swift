//
//  ApiManager.swift
//  ServiceSet
//
//  Created by Kirill Baranov on 30/03/24.
//

import Foundation
import Network

struct APIManager {
	
	let servicesUrl = "https://publicstorage.hb.bizmrg.com/sirius/result.json"
	let monitor = NWPathMonitor()
	
	
	func loadServices(completion: @escaping (Result<APIResponse, APIErrors>) -> Void) {
		monitor.start(queue: DispatchQueue.global(qos: .background))
		monitor.pathUpdateHandler = { path in
			if path.status == .satisfied {
				fetchData(from: servicesUrl, completion: completion)
			} else {
				completion(.failure(.noInternetConnection))
			}
		}
	}
	
	private func fetchData<T: Codable> (
		from url: String,
		completion: @escaping (Result<T, APIErrors>) -> Void) {
			
			guard let url = URL(string: url) else {
				completion(.failure(.invalidURL))
				return
			}
			
			URLSession.shared.dataTask(with: url) { data, response, error in
				if error != nil {
					completion(.failure(.noData))
					return
				}
				
				guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
					completion(.failure(.invalidResponse))
					return
				}
				
				if let data {
					do {
						let decoded = try JSONDecoder().decode(T.self, from: data)
						completion(.success(decoded))
					} catch {
						completion(.failure(.decodingError))
					}
				}
				
			}.resume()
		}
}
