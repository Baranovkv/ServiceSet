//
//  ErrorView.swift
//  ServiceSet
//
//  Created by Kirill Baranov on 30/03/24.
//

import SwiftUI

struct ResponceErrorView: View {
	let error: APIErrors
	
    var body: some View {
		Text(error.description)
			.background {
				RoundedRectangle(cornerRadius: 16)
					.foregroundStyle(.thinMaterial)
			}
    }
}

//#Preview {
//    ErrorView()
//}
