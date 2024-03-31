//
//  APIErrors.swift
//  ServiceSet
//
//  Created by Kirill Baranov on 30/03/24.
//

import Foundation

enum APIErrors: Error {
	case noInternetConnection
	case invalidURL
	case noData
	case invalidResponse
	case decodingError
	
	var description: String {
		switch self {
		case .noInternetConnection:
			"Нет соединения с интернетом"
		default:
			"Не удается загрузить данные"
		}
	}
}
