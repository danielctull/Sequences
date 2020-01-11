
import Sequences
import XCTest

final class BreadthFirstSequenceTests: XCTestCase {

    func test() {

        struct Item {
            let name: String
            let children: [Item]
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

        let hierarchy = BreadthFirstSequence(initial: item, children: {
            $0.children
        })

        XCTAssertEqual(hierarchy.map { $0.name }, [
            "0",
            "0.0",
            "0.1",
            "0.2",
            "0.0.0",
            "0.0.1",
            "0.1.0",
            "0.1.1",
            "0.2.0",
            "0.2.1",
            "0.0.0.0",
            "0.0.0.1",
            "0.1.1.0",
            "0.1.1.1"
        ])
    }
}
