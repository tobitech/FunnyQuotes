import SwiftUI

struct QuotesView: View {
	var body: some View {
		VStack {
			Image(systemName: "globe")
				.imageScale(.large)
				.foregroundColor(.accentColor)
			Text("Hello, world!")
		}
		.padding()
	}
}

struct QuotesView_Previews: PreviewProvider {
	static var previews: some View {
		QuotesView()
	}
}
