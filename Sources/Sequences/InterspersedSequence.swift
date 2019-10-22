
extension Sequence {

    /// Returns a sequence containing elements of this sequence with the
    /// given separator inserted between each element.
    ///
    /// This example shows how an array of String instances can be interspersed,
    /// using a String as the separator:
    /// ```
    /// let array = ["A", "B", "C", "D"]
    /// let sequence = array.interspersed(with: "-")
    /// print(Array(sequence))
    ///
    /// -> prints ["A", "-", "B", "-", "C", "-", "D"]
    /// ```
    ///
    /// The following example shows a String being interspersed with a Character:
    /// ```
    /// let string = "ABCDE"
    /// let sequence = string.interspersed(with: "-")
    /// print(String(sequence))
    ///
    /// -> prints "A-B-C-D-E"
    /// ```
    ///
    /// - Parameter separator: An element to insert between each of this sequence’s elements.
    /// - Returns: The interspersed sequence of elements.
    public func interspersed(with separator: Element) -> InterspersedSequence<Self> {
        return InterspersedSequence(base: self, separator: separator)
    }
}

/// A sequence that presents the elements of a base sequence of elements
/// concatenated using a given separator.
public struct InterspersedSequence<Base: Sequence> {
    fileprivate let base: Base
    fileprivate let separator: Base.Element
}

extension InterspersedSequence {

    public struct Iterator {

        private enum State {
            case start
            case base(element: Base.Element)
            case separator
        }

        private var base: Base.Iterator
        private let separator: Base.Element
        private var state = State.start

        fileprivate init(base: Base.Iterator, separator: Element) {
            self.base = base
            self.separator = separator
        }
    }
}

extension InterspersedSequence.Iterator: IteratorProtocol {

    public mutating func next() -> Base.Element? {

        switch state {

        case .start:
            state = .separator
            return base.next()

        case .separator:
            guard let next = base.next() else { return nil }
            state = .base(element: next)
            return separator

        case .base(let element):
            state = .separator
            return element
        }
    }
}

extension InterspersedSequence: Sequence {

    public func makeIterator() -> InterspersedSequence<Base>.Iterator {
        Iterator(base: base.makeIterator(), separator: separator)
    }

    public var underestimatedCount: Int {
        return Swift.max(0, 2 * base.underestimatedCount - 1)
    }
}
