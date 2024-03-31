//
//  APIResponce.swift
//  ServiceSet
//
//  Created by Kirill Baranov on 30/03/24.
//

import Foundation

struct APIResponse: Codable {
	let body: Body
	let status: Int
}

struct Body: Codable {
	let services: [Service]
}
