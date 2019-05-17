
public struct DepthFirstSequence<Element> {

    private let initial: Element
    private let children: (Element) -> [Element]

    public init(initial: Element, children: @escaping (Element) -> [Element]) {
        self.initial = initial
        self.children = children
    }
}

extension DepthFirstSequence {

    public struct Iterator {

        private var elements: [Element]
        private let children: (Element) -> [Element]

        fileprivate init(parent: Element, children: @escaping (Element) -> [Element]) {
            elements = [parent]
            self.children = children
        }
    }
}

extension DepthFirstSequence.Iterator: IteratorProtocol {

    public mutating func next() -> Element? {

        guard let next = elements.popLast() else { return nil }

        elements.append(contentsOf: children(next).reversed())
        return next
    }
}

extension DepthFirstSequence: Sequence {

    public func makeIterator() -> Iterator {
        return Iterator(parent: initial, children: children)
    }
}
