
extension Sequence {

    /// Creates a sequence which repeats the receiver's elements a given number
    /// of times.
    ///
    /// For example:
    ///
    /// `[1, 2, 3, 4].repeatingElements(3)`
    ///
    /// will return the sequence:
    ///
    /// `1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4`
    ///
    /// - Parameter amount: The amount of times to repeat the elements.
    /// - Returns: The sequence of repeated elements.
    public func repeatingElements(_ amount: Int) -> RepeatingElementsSequence<Self> {
        RepeatingElementsSequence(base: self, amount: amount)
    }
}

public struct RepeatingElementsSequence<Base: Sequence> {
    fileprivate let base: Base
    fileprivate let amount: Int
}

extension RepeatingElementsSequence {

    public struct Iterator {

        private var base: Base.Iterator
        private let amount: Int
        private var count = 0
        private var element: Base.Element?

        fileprivate init(base: Base.Iterator, amount: Int) {
            self.base = base
            self.amount = amount
            element = self.base.next()
        }
    }
}

extension RepeatingElementsSequence.Iterator: IteratorProtocol {

    public mutating func next() -> Base.Element? {

        guard amount > 0 else { return nil }

        if count >= amount {
            count = 0
            element = base.next()
        }

        count += 1
        return element
    }
}

extension RepeatingElementsSequence: Sequence {

    public func makeIterator() -> Iterator {
        Iterator(base: base.makeIterator(), amount: amount)
    }

    public var underestimatedCount: Int { return amount * base.underestimatedCount }
}
