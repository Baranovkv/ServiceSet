//
//  ServiceListView.swift
//  ServiceSet
//
//  Created by Kirill Baranov on 30/03/24.
//

import SwiftUI

struct ServiceView: View {
	@Environment(\.openURL) private var openURL
	@State var isURLInvalid = false
	
	let service: Service
	
	var body: some View {
		Button(action: {
			if let url = URL(string: service.link) {
				openURL(url)
			} else {
				isURLInvalid = true
			}
		}, label: {
			HStack(spacing: 0) {
				AsyncImage(url: service.iconURL) { phase in
					if let image = phase.image {
						image
							.resizable()
							.scaledToFit()
					} else if phase.error != nil {
						Image(systemName: "app")
							.scaledToFit()
					} else {
						ProgressView()
					}
				}
				.frame(height: 64)
				.padding(.trailing, 16)
				
				VStack(alignment: .leading) {
					Text(service.name)
						.font(.title3)
					Text(service.description)
						.font(.footnote)
				}
				Spacer()
				Image(systemName: "chevron.forward")
					.foregroundStyle(.secondary)
			}
		})
		.alert("Ссылка недоступна", isPresented: $isURLInvalid) {
			Button("Ок") { }
		} message: {
			Text("Попробуйте позже")
		}
	}
}

//#Preview {
//    ServiceView()
//}
