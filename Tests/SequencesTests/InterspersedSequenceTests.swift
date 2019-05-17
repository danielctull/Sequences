
import Sequences
import XCTest

final class InterspersedSequenceTests: XCTestCase {

    func testStringJoin() {
        let string = "ABCDE"
        let sequence = string.interspersed(with: "-")
        XCTAssertEqual(String(sequence), "A-B-C-D-E")
    }

    func testStringEmpty() {
        let string = ""
        let sequence = string.interspersed(with: "-")
        XCTAssertEqual(String(sequence), "")
    }

    func testArrayJoin() {
        let array = [1,2,3,4]
        let sequence = array.interspersed(with: 0)
        XCTAssertEqual(Array(sequence), [1,0,2,0,3,0,4])
    }

    func testArrayEmpty() {
        let array: [Int] = []
        let sequence = array.interspersed(with: 0)
        XCTAssertEqual(Array(sequence), [])
    }
}
