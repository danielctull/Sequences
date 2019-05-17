
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
        private var current: Element?
        private let children: (Element) -> [Element]
        private var iterators: [DepthFirstSequence.Iterator] = []

        fileprivate init(parent: Element, children: @escaping (Element) -> [Element]) {
            current = parent
            self.children = children
        }
    }
}

extension DepthFirstSequence.Iterator: IteratorProtocol {

    public mutating func next() -> Element? {

        if let current = current {

            iterators = children(current).map { DepthFirstSequence.Iterator(parent: $0, children: children) }

            self.current = nil

            print("NEXT: \(current)")

            return current
        }

        while !iterators.isEmpty {

            var iterator = iterators[0]

            guard let child = iterator.next() else {
                iterators = Array(iterators.dropFirst())
                continue
            }

            iterators[0] = iterator

            return child
        }

        return nil
    }
}

extension DepthFirstSequence: Sequence {

    public func makeIterator() -> Iterator {
        return Iterator(parent: initial, children: children)
    }
}
