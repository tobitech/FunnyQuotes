import ComposableArchitecture
import SwiftUI

extension Store where State: Equatable & Identifiable {
	var id: State.ID {
		ViewStore(self, observe: \.id).state
	}
}

extension View {
	public func tag<ID: Hashable, Action>(store: @escaping @autoclosure () -> Store<ID, Action>) -> some View {
		self.modifier(IDModifier(store: store))
	}
}

struct IDModifier<ID: Hashable>: ViewModifier {
	@StateObject var viewStore: ViewStore<ID, Never>
	init<Action>(store: @escaping () -> Store<ID, Action>) {
		self._viewStore = .init(wrappedValue: .init(store().actionless, observe: { $0 }))
	}
	
	func body(content: Content) -> some View {
		content
			.tag(viewStore.state)
	}
}
