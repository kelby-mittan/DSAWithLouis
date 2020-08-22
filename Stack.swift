class MyStack<T> {
  private class StackNode<T> {
    var data: T
    var nextBeneath: StackNode<T>?
    init(_ item: T) {
      data = item
      nextBeneath = nil
    }
  }

  private var topNode: StackNode<T>?

  init() {
    topNode = nil
  }

  func pop() -> T? {
    // guard topNode != nil else { return T}
    return topNode?.data
  }

  func push(_ item: T) {
    let new = StackNode(item)
    new.nextBeneath = topNode
    topNode = new
  }

  func peek() -> T? {
    // guard if topnode is nil
    return topNode?.data
  }

  func isEmpty() -> Bool {
    return topNode == nil
  }
}

let myStack = MyStack<String>()
myStack.push("hey")
myStack.push("what up")
print(myStack.peek()!) // ?
print(myStack.pop()!)// ?
print(myStack.peek()!)
