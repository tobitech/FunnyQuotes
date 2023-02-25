import ComposableArchitecture
import Foundation
import SwiftUI

struct QuoteItem: ReducerProtocol {
	
	struct State: Equatable, Identifiable {
		var quote: Quote
		var id: String {
			return quote.id
		}
	}
	
	enum Action: Equatable {
		case onAppear
	}
	
	var body: some ReducerProtocol<State, Action> {
		Reduce { state, action in
			switch action {
			case .onAppear:
				return .none
			}
		}
	}
}

struct QuoteItemView: View {
	
	let store: StoreOf<QuoteItem>
	@ObservedObject var viewStore: ViewStoreOf<QuoteItem>
	
	init(store: StoreOf<QuoteItem>) {
		self.store = store
		self.viewStore = ViewStore(store)
	}
	
	var body: some View {
		ZStack(alignment: .center) {
			RoundedRectangle(cornerRadius: 20)
				.stroke(.secondary, lineWidth: 1)
			Text(self.viewStore.quote.content)
				.padding()
		}
		.padding()
	}
}
