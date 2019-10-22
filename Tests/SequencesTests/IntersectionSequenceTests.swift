
import Sequences
import XCTest

final class IntersectionSequenceTests: XCTestCase {

    func testIntersectionWhere() {
        let result = [1,2,3,4].intersection(with: [4,8,12,16,20],
                                            where: { $0 * $0 == $1 })
        XCTAssertEqual(Array(result), [2,4])
    }

    func testIntersection1() {
        let result = [1,2,3,4].intersection(with: [5,4,3])
        XCTAssertEqual(Array(result), [3,4])
    }

    func testIntersection2() {
        let result = [1,1,2,2,3,3,4,4].intersection(with: [5,4,3])
        XCTAssertEqual(Array(result), [3,3,4,4])
    }
}
