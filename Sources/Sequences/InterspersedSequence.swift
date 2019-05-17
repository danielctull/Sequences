
/// A sequence that presents the elements of a base sequence of elements
/// concatenated using a given separator.
public struct InterspersedSequence<Base: Sequence> {

    private let base: Base
    private let separator: Base.Element

    /// Creates a sequence that presents the elements in base interleaved with
    /// the separator.
    ///
    /// - Parameters:
    ///   - base: The original sequence of elements.
    ///   - separator: The separator to insert between elements.
    public init(base: Base, separator: Base.Element) {
        self.base = base
        self.separator = separator
    }
}

extension InterspersedSequence {

    /// An iterator that presents the elements of base sequence of elements
    /// concatenated using a given separator.
    public struct Iterator {

        private enum State {
            case start
            case base(element: Base.Element)
            case separator
        }

        private var base: Base.Iterator
        private let separator: Base.Element
        private var state = State.start

        /// Creates an iterator that presents the elements in base interleaved
        /// with the separator.
        ///
        /// - Parameters:
        ///   - base: The base iterator of elements.
        ///   - separator: The separator to insert between elements.
        fileprivate init(base: Base.Iterator, separator: Element) {
            self.base = base
            self.separator = separator
        }
    }
}

extension InterspersedSequence.Iterator: IteratorProtocol {

    /// Advances to the next element and returns it, or nil
    /// if no next element exists.
    ///
    /// - Returns: The next element or nil if no next element exists.
    public mutating func next() -> Base.Element? {

        switch state {

        case .start:
            state = .separator
            return base.next()

        case .separator:
            if let next = base.next() {
                state = .base(element: next)
                return separator
            } else {
                return nil
            }

        case .base(let element):
            state = .separator
            return element
        }
    }
}

extension InterspersedSequence: Sequence {

    /// Return an iterator over the elements of this sequence.
    ///
    /// - Returns: An iterator over the elements of this sequence.
    public func makeIterator() -> InterspersedSequence<Base>.Iterator {
        return Iterator(base: base.makeIterator(), separator: separator)
    }
}

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
