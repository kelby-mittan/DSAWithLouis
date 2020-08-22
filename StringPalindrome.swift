// Given a string, write a function to check if it is a permutation of a palindrome
// a palindrome is a word or phrase that is the same forwards and backwards
// a permutation is a rearrangemenet of letters
// the palindrome does not need to be limited to just dictionary words

// example
// input: "tact coa"
// output: True, (permutations: "taco cat", "atco cta", etc.)

// steps
// 1. count the num of occurences for each char
// 2. if they're all even then a permutation can be made
// 3. as long as there's only one char that has an odd num of occurences return True

func isPalindrome(str: String) -> Bool {

  let occDict = getOccurences(str: str)

  var oddOccurrences = 0

  for (_, val) in occDict {
    if val % 2 == 1 {
      oddOccurrences += 1
    }
  }

  return oddOccurrences <= 1

}

func getOccurences(str: String) -> [Character:Int] {
  var occDict: [Character:Int] = [:]

  for char in str {
    if char != " " {
      if occDict[char] == nil {
      occDict[char] = 1
    } else {
      occDict[char]! += 1
    }
    }
    
  }
}

assert(isPalindrome(str: "racecar"))
assert(isPalindrome(str: "notaracecar")==false)
// assert(isPalindrome(str: "tact coa"))

print("success!")