//
//  MainView.swift
//  ServiceSet
//
//  Created by Kirill Baranov on 30/03/24.
//

import SwiftUI

struct ServiceListView: View {
	let set: [Service]?
    var body: some View {
		if let set {
			List(set) { service in
				ServiceView(service: service)
			}
			.listStyle(.plain)
		}
	}
}

//#Preview {
//	ServiceListView()
//}
