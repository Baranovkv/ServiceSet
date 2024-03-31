//
//  ServiceModel.swift
//  ServiceSet
//
//  Created by Kirill Baranov on 30/03/24.
//

import Foundation

struct Service: Codable, Identifiable {
	
	let name: String
	let description: String
	let link: String
	let iconStringURL: String
	
	var iconURL: URL? {
		URL(string: iconStringURL)
	}
	
	var id: String {
		self.name
	}
	
	enum CodingKeys: String, CodingKey {
		case name, description, link
		case iconStringURL = "icon_url"
	}
}

