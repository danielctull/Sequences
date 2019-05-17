#if !canImport(ObjectiveC)
import XCTest

extension BreadthFirstSequenceTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__BreadthFirstSequenceTests = [
        ("test", test),
    ]
}

extension DepthFirstSequenceTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__DepthFirstSequenceTests = [
        ("test", test),
    ]
}

extension InterspersedSequenceTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__InterspersedSequenceTests = [
        ("testArrayEmpty", testArrayEmpty),
        ("testArrayJoin", testArrayJoin),
        ("testStringEmpty", testStringEmpty),
        ("testStringJoin", testStringJoin),
    ]
}

extension LinkSequenceTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__LinkSequenceTests = [
        ("test", test),
    ]
}

extension RepeatingElementsSequenceTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__RepeatingElementsSequenceTests = [
        ("testRepeatingElements3", testRepeatingElements3),
        ("testRepeatingElements5", testRepeatingElements5),
    ]
}

extension ScanSequenceTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__ScanSequenceTests = [
        ("test", test),
    ]
}

public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(BreadthFirstSequenceTests.__allTests__BreadthFirstSequenceTests),
        testCase(DepthFirstSequenceTests.__allTests__DepthFirstSequenceTests),
        testCase(InterspersedSequenceTests.__allTests__InterspersedSequenceTests),
        testCase(LinkSequenceTests.__allTests__LinkSequenceTests),
        testCase(RepeatingElementsSequenceTests.__allTests__RepeatingElementsSequenceTests),
        testCase(ScanSequenceTests.__allTests__ScanSequenceTests),
    ]
}
#endif
