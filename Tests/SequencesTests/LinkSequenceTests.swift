
import Sequences
import XCTest

final class LinkSequenceTests: XCTestCase {

    final class View {
        let name: String
        let superview: View?

        init(name: String, superview: View? = nil) {
            self.name = name
            self.superview = superview
        }
    }

    func test() {
        let view = View(name: "1", superview: View(name: "2", superview: View(name: "3")))
        let sequence = LinkSequence(initial: view, next: { $0.superview })
        XCTAssertEqual(Array(sequence.map { $0.name }), ["1", "2", "3"])
    }
}
