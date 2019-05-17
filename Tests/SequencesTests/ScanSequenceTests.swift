
import Sequences
import XCTest

final class ScanSequenceTests: XCTestCase {

    func test() {
        let values = [1, 2, 3, 4]
        let result = values.scan(0, +)
        XCTAssertEqual(Array(result), [1, 3, 6, 10])
    }
}
