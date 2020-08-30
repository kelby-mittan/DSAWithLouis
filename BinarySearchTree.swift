

/**
  * Balanced Binary Search Tree
  */
class BinarySearchTree<T: Comparable> {
    public class Node<T: Comparable> {
      var val: T
      var left: Node?
      var right: Node?

      init(_ val: T) {
          self.val = val
      }
    }
    
    init() {}
    
    public var root: Node<T>?

    public func insert(_ val: T) {
      let newNode = Node(val)
      if root == nil { 
        root = newNode
        return
      }
      // guard root != nil else { return }
      guard let validRoot = root else { return }

      insertHelper(validRoot, newNode)
      let balanceFactor = getBalanceFactor(validRoot)
      // if balanced, then we're done
      if abs(balanceFactor) <= 1 {
        return
      }
      rebalance(validRoot)
    }

    private func rotateLeft(_ node: Node<T>) -> Node<T>? {
      let newParent = node.right
      node.right = nil
      newParent?.left = node
      return newParent
    }

    private func rotateRight(_ node: Node<T>) -> Node<T>? {
      let newParent = node.left
      node.left = nil
      newParent?.right = node
      return newParent
    }

    private func getBalanceFactor(_ node: Node<T>?) -> Int {
      return getHeightHelper(node?.right) - getHeightHelper(node?.left)
    }

    private func rebalance(_ node: Node<T>) {
      // if the balance factor is -2, 
        // rebalance the left side

        // if the left child has balance factor of 1
          // then rotate right around the right child
        // rotate left around the right child

      let balanceFactor = getBalanceFactor(node)
      if balanceFactor == -2 {
        print("balancing left side")
        let leftChildBalanceFactor = getBalanceFactor(node.left)
        if leftChildBalanceFactor == 1 {
          print("pre rotate left")
          node.left = rotateLeft(node.left!)
        }
        print(node.left?.val) // nil
        let newParent = rotateRight(node)
        if node === root {
          root = newParent
        }
      } else if balanceFactor == 2 {
        print("balancing right side")
        let rightChildBalanceFactor = getBalanceFactor(node.right)
        if rightChildBalanceFactor == -1 {
          node.right = rotateRight(node.right!)
        }
        let newParent = rotateLeft(node)
        if node === root {
          root = newParent
        }
      }
      // else the balanace factor is 2
        // rebalance the right side
        // if the right child has a balanace factor of -1
          // then rotate left around the left child
        // rotate right around the left child
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

    public func printTree() -> String {
      var str = ""
      if let leftChild = root?.left?.val {
        str += "(\(leftChild)) <- "
      }
      str += "\(root?.val)"
      if let rightChild = root?.right?.val {
        str += " -> (\(rightChild))"
      }
      return str
    }
}

extension BinarySearchTree: CustomStringConvertible {
  public var description: String {
    var str = ""
    if let left = root?.left {
      str += "(\(left.val)) <- "
    }
    str += "\(root!.val)"
    if let right = root?.right {
      str += " -> (\(right.val))"
    }
    return str
  }
}

let tree = BinarySearchTree<Int>()
tree.getHeight() // 0
tree.insert(1)
tree.getHeight() // 1
tree.insert(2)
tree.getHeight() // 2
tree.insert(3)
tree.insert(4)
tree.insert(5)
tree.insert(6)

print(tree.root!.val) // 2
print(tree.root!.left!.val) // 1
print(tree.root!.right!.val) // 3
print(tree.root!.right!.right!)
print(tree.printTree())
print(tree.description)
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
//         \
//          4


//    2  -2
//   /
//  1   1
//   \
//    3
