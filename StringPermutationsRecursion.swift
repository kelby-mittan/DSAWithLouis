// write a function that given a string returns a list of all its unique permutations
// input: "abc"
// output: ["abc, "acb", "bac", "bca", "cab", "cba"]

//1. 
func makePermutations(str: String) -> [String] {
  var results: [String] = []
  makePermutationsHelper(base: "", remaining: str, results: &results)
  print("the results are", results)
  return results
}

func makePermutationsHelper(base: String, remaining: String, results: inout [String]) {

  // BASE CASE
  if remaining.count == 0 {
    // AGGREGATION
    results.append(base)
    return
  }

  var s = remaining
  for i in 0..<remaining.count {
    let index = remaining.index(remaining.startIndex, offsetBy: i)
    let character = remaining[index]
    // INCREMENTAL STEP
    // all of the character except the one at index
    let nextIndex = remaining.index(remaining.startIndex, offsetBy: i+1)
    let newRemaining = String(remaining[..<index] + remaining[nextIndex...])
    // var character = String(s.first())
    // "hey".dropFirst() => "ey", "hey"
    // "hey".removeFirst() => "h", "ey"
    let newBase = base + String(character)
    print(newBase)
    print(s)
    makePermutationsHelper(base: newBase, remaining: newRemaining, results: &results)
  }
}