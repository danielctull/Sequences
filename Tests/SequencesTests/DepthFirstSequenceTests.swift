
import XCTest
import Sequences

final class DepthFirstSequenceTests: XCTestCase {

    func test() {

        struct Item {
            let name: String
            let children: [Item]

            var hierarchy: DepthFirstSequence<Item> {
                return DepthFirstSequence(initial: self, children: { $0.children })
            }
        }

        let item = Item(name: "0", children: [
            Item(name: "0.0", children: [
                Item(name: "0.0.0", children: [
                    Item(name: "0.0.0.0", children: []),
                    Item(name: "0.0.0.1", children: [])
                ]),
                Item(name: "0.0.1", children: [])
            ]),
            Item(name: "0.1", children: [
                Item(name: "0.1.0", children: []),
                Item(name: "0.1.1", children: [
                    Item(name: "0.1.1.0", children: []),
                    Item(name: "0.1.1.1", children: [])
                ])
            ]),
            Item(name: "0.2", children: [
                Item(name: "0.2.0", children: []),
                Item(name: "0.2.1", children: [])
            ])
        ])

        XCTAssertEqual(Array(item.hierarchy.map { $0.name }), [
            "0",
            "0.0",
            "0.0.0",
            "0.0.0.0",
            "0.0.0.1",
            "0.0.1",
            "0.1",
            "0.1.0",
            "0.1.1",
            "0.1.1.0",
            "0.1.1.1",
            "0.2",
            "0.2.0",
            "0.2.1"
        ])
    }
}
