import SwiftUI

@main
struct FunnyQuotesApp: App {
	var body: some Scene {
		WindowGroup {
			QuotesView(
				store: .init(
					initialState: .init(),
					reducer: QuotesFeature())
			)
		}
	}
}
