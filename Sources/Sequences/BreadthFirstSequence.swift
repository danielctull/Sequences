
public struct BreadthFirstSequence<Element> {

    private let initial: Element
    private let children: (Element) -> [Element]

    public init(initial: Element, children: @escaping (Element) -> [Element]) {
        self.initial = initial
        self.children = children
    }
}

extension BreadthFirstSequence {

    public struct Iterator {
        fileprivate var elements: [Element]
        fileprivate let children: (Element) -> [Element]
    }
}

extension BreadthFirstSequence.Iterator: IteratorProtocol {

    public mutating func next() -> Element? {

        guard let next = elements.popLast() else { return nil }

        elements.insert(contentsOf: children(next).reversed(), at: 0)
        return next
    }
}

extension BreadthFirstSequence: Sequence {

    public func makeIterator() -> Iterator {
        Iterator(elements: [initial], children: children)
    }
}
