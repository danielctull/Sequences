
/// A sequence that allows the traversal of elements that provide the next
/// element, such as a responder chain or superview hierarchy.
public struct LinkSequence<Element> {

    private let initial: Element
    private let next: (Element) -> Element?

    /// Create a link sequence.
    ///
    /// - Parameters:
    ///   - initial: The initial value.
    ///   - next: A closure to provide the next element.
    public init(initial: Element, next: @escaping (Element) -> Element?) {
        self.initial = initial
        self.next = next
    }
}

extension LinkSequence {

    public struct Iterator {

        private var current: Element?
        private let nextElement: (Element) -> Element?

        fileprivate init(current: Element, nextElement: @escaping (Element) -> Element?) {
            self.current = current
            self.nextElement = nextElement
        }
    }
}

extension LinkSequence.Iterator: IteratorProtocol {

    public mutating func next() -> Element? {

        guard let element = current else { return nil }

        current = nextElement(element)
        return element
    }
}

extension LinkSequence: Sequence {

    public func makeIterator() -> Iterator {
        Iterator(current: initial, nextElement: next)
    }
}
