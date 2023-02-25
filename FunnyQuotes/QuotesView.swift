import SwiftUI

struct QuotesView: View {
	var body: some View {
		TabView(
			selection: .constant(0),
			content: {
				ForEach(Array(Quote.quotes.enumerated()), id: \.offset) { index, quote in
					QuoteItemView(quote: quote)
					.tag(index)
				}
		})
		.tabViewStyle(.page(indexDisplayMode: .never))
		.frame(height: 250)
		.padding()
	}
}

struct QuoteItemView: View {
	
	var quote: Quote
	
	var body: some View {
		ZStack(alignment: .center) {
			RoundedRectangle(cornerRadius: 20)
				.stroke(.secondary, lineWidth: 1)
			Text(self.quote.content)
				.padding()
		}
		.padding()
	}
}

struct QuotesView_Previews: PreviewProvider {
	static var previews: some View {
		QuotesView()
	}
}
