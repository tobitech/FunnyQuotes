import Foundation

struct Quote {
	var content: String
	var author: String
}

extension Quote {
	static let quotes: [Quote] = [
		.init(
			content: """
			Momentum goes both ways.
			Don’t move, feel sluggish. Start moving, feel like moving a little more.
			Don’t talk, feel timid. Start chatting, conversation gets a little easier.
			Don’t ship, feel stuck. Start creating, ideas begin to flow.
			""",
			author: "James Clear"
		),
		.init(
			content: """
				Inspiration is not the exclusive privilege of poets or artists.
				There is, there has been, there will always be a certain group of people whom inspiration visits.
				It’s made up of all those who’ve consciously chosen their calling and do their job with love and imagination.
				It may include doctors, teachers, gardeners — I could list a hundred more professions.
				Their work becomes one continuous adventure as long as they manage to keep discovering new challenges in it. Difficulties and setbacks never quell their curiosity.
				A swarm of new questions emerges from every problem that they solve. Whatever inspiration is, it’s born from a continuous I don’t know.
			""",
			author: "Wislawa Szymborska"
		),
		.init(
			content: """
			The edge is in the inputs.

			The person who consumes from better sources, gets better thoughts. The person who asks better questions, gets better answers. The person who builds better habits, gets better results.

			It’s not the outcomes. It’s the inputs..
			""",
			author: "Anna Morini"
		),
		.init(
			content: """
			Momentum goes both ways.

			Don’t move, feel sluggish. Start moving, feel like moving a little more.

			Don’t talk, feel timid. Start chatting, conversation gets a little easier.

			Don’t ship, feel stuck. Start creating, ideas begin to flow.
			""",
			author: "Creme Dim"
		),
		.init(
			content: """
			Mountaineer Alex Lowe on how to be the best:
			The best climber in the world is the one who’s having the most fun..
			""",
			author: "Outside Magazine"
		)
	]
}
