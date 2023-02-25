import ComposableArchitecture
import SwiftUI

struct QuotesFeature: ReducerProtocol {
	
	struct State: Equatable {
		var quotes: IdentifiedArrayOf<QuoteItem.State>
		var selectedAuthor: String
		var selectedTab: String?
		
		init(
			quotes: IdentifiedArrayOf<QuoteItem.State> = [],
			selectedAuthor: String = "No Author Selected",
			selectedTab: String? = nil
		) {
			self.quotes = quotes
			self.selectedAuthor = selectedAuthor
			self.selectedTab = selectedTab
		}
	}
	
	enum Action: Equatable {
		case onAppear
		case quote(id: QuoteItem.State.ID, action: QuoteItem.Action)
		case selectedTabChanged(String?)
	}
	
	var body: some ReducerProtocol<State, Action> {
		Reduce { state, action in
			switch action {
			case .onAppear:
				let items = Quote.quotes.map { QuoteItem.State.init(quote: $0) }
				state.quotes = .init(uniqueElements: items)
				if let lastItemId = state.quotes.last?.id,
						let lastItem = state.quotes[id: lastItemId] {
					state.selectedTab = lastItemId
					state.selectedAuthor = " By \(lastItem.quote.author)"
				}
				return .none
				
			case let .quote(id: id, action: .onAppear):
				print(id)
				return .none
				
			case let .selectedTabChanged(tab):
				print("Selected Tab ID:", tab) // ⚠️ Selected Tab doesn't changed in this action and emitting twice.
				if let id = tab,
						let selectedItem = state.quotes[id: id] {
					state.selectedTab = id
					state.selectedAuthor = " By \(selectedItem.quote.author)"
				}
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
		VStack {
			TabView(
				selection: self.viewStore.binding(
					get: \.selectedTab,
					send: QuotesFeature.Action.selectedTabChanged
				),
				content: {
					ForEachStore(
						self.store.scope(
							state: \.quotes,
							action: QuotesFeature.Action.quote(id:action:)
						)
					) { store in
						QuoteItemView(store: store)
							.tag(store.id)
							// .tag(store: store.scope(state: \.id))
					}
			})
			.tabViewStyle(.page(indexDisplayMode: .never))
			.frame(height: 250)
			.padding()
			
			Text(self.viewStore.selectedAuthor)
		}
		.onAppear { self.viewStore.send(.onAppear) }
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
