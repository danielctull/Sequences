
import Sequences
import XCTest

final class RepeatingElementsSequenceTests: XCTestCase {

    func testRepeatingElements3() {
        let result = [1, 2, 3, 4].repeatingElements(3)
        XCTAssertEqual(Array(result), [1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4])
    }

    func testRepeatingElements5() {
        let result = "ABCDE".repeatingElements(5)
        XCTAssertEqual(String(result), "AAAAABBBBBCCCCCDDDDDEEEEE")
    }
}
