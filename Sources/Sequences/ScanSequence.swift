
/// A sequence of applying a transform to the element of a sequence and the
/// previously transformed result.
public struct ScanSequence<Result, Base: Sequence> {

    private let base: Base
    private let initial: Result
    private let transform: (Result, Base.Element) -> Result

    public init(
        base: Base,
        initial: Result,
        transform: @escaping (Result, Base.Element) -> Result
    ) {
        self.base = base
        self.initial = initial
        self.transform = transform
    }
}

extension ScanSequence {

    public struct Iterator {
        fileprivate var base: Base.Iterator
        fileprivate var result: Result
        fileprivate let transform: (Result, Base.Element) -> Result
    }
}

extension ScanSequence.Iterator: IteratorProtocol {

    public mutating func next() -> Result? {
        guard let element = base.next() else { return nil }
        result = transform(result, element)
        return result
    }
}

extension ScanSequence: Sequence {

    public func makeIterator() -> Iterator {
        return Iterator(base: base.makeIterator(),
                        result: initial,
                        transform: transform)
    }
}

extension Sequence {

    public func scan<Result>(
        _ initial: Result,
        _ transform: @escaping (Result, Element) -> Result
    ) -> ScanSequence<Result, Self> {
        return ScanSequence(base: self, initial: initial, transform: transform)
    }
}
