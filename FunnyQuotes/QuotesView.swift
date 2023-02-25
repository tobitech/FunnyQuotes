import ComposableArchitecture
import SwiftUI

struct QuotesFeature: ReducerProtocol {
	
	struct State: Equatable {
		var quotes: [Quote]
		var selectedTab: Int
		
		init(
			quotes: [Quote] = [],
			selectedTab: Int = 0
		) {
			self.quotes = quotes
			self.selectedTab = selectedTab
		}
	}
	
	enum Action: Equatable {
		case onAppear
		case selectedTabChanged(Int)
	}
	
	var body: some ReducerProtocol<State, Action> {
		Reduce { state, action in
			switch action {
			case .onAppear:
				state.quotes = Quote.quotes
				if !state.quotes.isEmpty {
					state.selectedTab = state.quotes.count - 1
				}
				return .none
				
			case let .selectedTabChanged(tab):
				state.selectedTab = tab
				return .none
			}
		}
	}
}

struct QuotesView: View {
	
	let store: StoreOf<QuotesFeature>
	@ObservedObject var viewStore: ViewStoreOf<QuotesFeature>
	
	init(store: StoreOf<QuotesFeature>) {
		self.store = store
		self.viewStore = ViewStore(store)
	}
	
	var body: some View {
		TabView(
			selection: self.viewStore.binding(
				get: \.selectedTab,
				send: QuotesFeature.Action.selectedTabChanged
			),
			content: {
				ForEach(Array(self.viewStore.quotes.enumerated()), id: \.offset) { index, quote in
					QuoteItemView(quote: quote)
					.tag(index)
				}
		})
		.tabViewStyle(.page(indexDisplayMode: .never))
		.frame(height: 250)
		.padding()
		.onAppear { self.viewStore.send(.onAppear) }
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
		QuotesView(
			store: .init(
				initialState: .init(),
				reducer: QuotesFeature())
		)
	}
}
