
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

        private var elements: [Element]
        private let children: (Element) -> [Element]

        fileprivate init(parent: Element, children: @escaping (Element) -> [Element]) {
            elements = [parent]
            self.children = children
        }
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
        return Iterator(parent: initial, children: children)
    }
}
