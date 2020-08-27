

/**
  * Balanced Binary Search Tree
  */
class BinarySearchTree<T: Comparable> {
    private class Node<T: Comparable> {
      var val: T
      var left: Node?
      var right: Node?

      init(_ val: T) {
          self.val = val
      }
    }
    
    init() {}
    
    private var root: Node<T>?

    public func insert(_ val: T) {
      let newNode = Node(val)
      if root == nil { 
        root = newNode
        return
      }
      // guard root != nil else { return }
      guard let validRoot = root else { return }

      insertHelper(validRoot, newNode)
      // at least one other node in the tree
    }

    private func insertHelper(_ parent: Node<T>, _ node: Node<T>) {
        // look at the parent...
        if parent.val > node.val {
          if let newLeft = parent.left {
              insertHelper(newLeft, node)
          } else {
              parent.left = node
          }
        } else if parent.val < node.val {
            if let newRight = parent.right {
                insertHelper(newRight, node)
            } else {
                parent.right = node
            }
        }
        // if it's equal value, do nothing as the tree does not have duplicates
        
    }
    // public func getHeight() -> Int {
    //   return getHeightHelper(root, 0)
    // }

    public func getHeight() -> Int {
      return getHeightHelper(root)
    }

    // private func getHeightHelper(_ node: Node<T>?, _ height: Int) -> Int {
    //     // if node is nil then...
    //     // if the left and the right are nil then the height is 1
    //     // 1 + helper(node.left)
        
    //     if node == nil {
    //       return height
    //     }
        

    //     return max(
    //       getHeightHelper(node?.left, height + 1),
    //       getHeightHelper(node?.right, height + 1)
    //     )
    // }

    private func getHeightHelper(_ node: Node<T>?) -> Int {
      if node == nil {
        return 0
      }
      return 1 + max(
       getHeightHelper(node!.left), getHeightHelper(node!.right)
      )
    }

    // size (# of nodes)
    // insert
      // balance (heights of each branch are within n-1)
      // sort it (rotate as needed)
    // getRoot

    // depth_first_traverse (in order traversal)
    // bread_first_traverse
}

let tree = BinarySearchTree<Int>()
tree.getHeight() // 0
tree.insert(1)
tree.getHeight() // 1
tree.insert(2)
tree.getHeight() // 2
tree.insert(3)

print(tree.getHeight()) // expect this to be 2
// let expectation = """
//   2
//  / \
// 1   3
// """
// assert(b.toString() == expectation)

//    1
//     \
//      2
//       \
//        3


//    2
//   / \
//  1   3
