
extension Sequence {

    public func intersection<Other: Sequence>(
        with other: Other
    ) -> IntersectionSequence<Self, Other>
        where
        Element: Equatable,
        Other.Element == Element
    {

        IntersectionSequence(base: self,
                             intersect: other,
                             predicate: { $0 == $1 })
    }

    public func intersection<Other: Sequence>(
        with other: Other,
        where predicate: @escaping (Element, Other.Element) -> Bool
    ) -> IntersectionSequence<Self, Other> {

        IntersectionSequence(base: self,
                             intersect: other,
                             predicate: predicate)
    }
}

public struct IntersectionSequence<Base: Sequence, Intersect: Sequence> {
    fileprivate let base: Base
    fileprivate let intersect: Intersect
    fileprivate let predicate: (Base.Element, Intersect.Element) -> Bool
}

extension IntersectionSequence {

    public struct Iterator {
        fileprivate var base: Base.Iterator
        fileprivate let intersect: [Intersect.Element]
        fileprivate let predicate: (Base.Element, Intersect.Element) -> Bool
    }
}

extension IntersectionSequence.Iterator: IteratorProtocol {

    public mutating func next() -> Base.Element? {

        while let next = base.next() {
            if intersect.contains(where: { predicate(next, $0) }) {
                return next
            }
        }

        return nil
    }
}

extension IntersectionSequence: Sequence {

    public func makeIterator() -> Iterator {
        Iterator(base: base.makeIterator(),
                 intersect: Array(intersect),
                 predicate: predicate)
    }
}
