/*
G  write a function to check if they are the same or not.

Two binary trees are considered the same if they are structurally identical and the nodes have the same value.
*/

enum Side {
  case left
  case right
}

class BinaryTree<T: Comparable> {
  var root: Node<T>?

  init() {}

@discardableResult
  func insert(value: T, parent: Node<T>?, side: Side) -> Node<T>? {
    let insertedNode = Node<T>(value)
    // if there's no parent specified, this should be inserted/replaced at the root
    guard let parent = parent else {
      if root != nil {
        // If there was an existing root, graft its subtrees onto the new root
        insertedNode.left = root!.left
        insertedNode.right = root!.right
      }
      root = insertedNode
      return insertedNode
    }
    switch side {
    case .left:
      parent.left = insertedNode
    case .right:
      parent.right = insertedNode
    }
    return insertedNode
  }

  func compare(_ other: BinaryTree<T>) -> Bool {
    print("compare!")
    return compareNodes(this: root, that: other.root)
  }

    func compareNodes(this: Node<T>?, that: Node<T>?) -> Bool {
      if this == nil && that == nil {
          return true
      }
      print("try here")
      if this?.val != that?.val {
        return false
      }
      print("here!!!!")
      return compareNodes(this: this?.left, that: that?.left) && compareNodes(this: this?.right, that: that?.right)
  }
  // delete
  // depth_first_traverse
  // breadth_first_traverse
}

class Node<T: Comparable> {
  var val: T
  var left: Node?
  var right: Node?
  init(_ val: T) {
    self.val = val
  }
}

let treeA = BinaryTree<Int>()
let rootNode = treeA.insert(value: 2, parent: nil, side: Side.left)
treeA.insert(value: 1, parent: rootNode, side: Side.left)
treeA.insert(value: 3, parent: rootNode, side: Side.right)

let treeB = BinaryTree<Int>()
let rootNodeB = treeB.insert(value: 2, parent: nil, side: Side.left)
treeB.insert(value: 1, parent: rootNodeB, side: Side.left)
let insertedB = treeB.insert(value: 3, parent: rootNodeB, side: Side.right)
print("This should be true", treeA.compare(treeB)) // True
treeB.insert(value: 4, parent: treeB.root?.right, side: Side.right)
print("This should be false", treeA.compare(treeB)) // True

// var root = Node<Int>(2)
// var nodeOne = Node<Int>(1)
// var nodeThree = Node<Int>(3)
// root.left = nodeOne
// root.right = nodeThree

// tree
//   2
//  / \
// 1   3
// treeB.insert(4)
//   2
//  / \
// 1   3
//      \ 
//       4
// treeB.insert(5)
//     3
//    / \
//   2   4
//  /     \ 
// 1       5

        //    1         1
        //   / \       / \
        //  2   1     1   2
// Binary tree -> doesn't have to ordered or height equal
// Binary search trees, aka sorted binary tree, aka ordered binary tree -> has to be ordered,
// Balanced binary trees
