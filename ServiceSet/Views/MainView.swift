//
//  ContentView.swift
//  ServiceSet
//
//  Created by Kirill Baranov on 30/03/24.
//

import SwiftUI

struct MainView: View {
	
	@State var serviceSet = ServiceSet()
	
	var body: some View {
		NavigationStack {
			VStack {
				switch serviceSet.loadingState {
					
				case .loading:
					ProgressView()
				case .loaded:
					ServiceListView(set: serviceSet.set)
				case .failed:
					ResponceErrorView(error: serviceSet.responceError!)
				}
				
			}
			.navigationTitle("Сервисы")
			.navigationBarTitleDisplayMode(.inline)
		}
		.onAppear {
			serviceSet.loadServices()
		}
	}
}

#Preview {
	MainView()
}
