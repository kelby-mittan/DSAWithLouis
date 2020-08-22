//a child is running up a staircase with n steps
// can hop either 1, 2 or 3 steps at a time.

// implement a method to count how many possible ways the child can run up the stairs

// building blocks of recursion:
// 1. base case
// 2. iterative step
// 3. aggregation

// base case - when there's 1 step, there's only 1 combo
// iterative step - which size step size chosen
// aggregation - count/sum of all possible paths

// 1. 2 
// [1,1] [2]

func numberOfHops(_ n: Int) -> Int {
  if n <= 0 {
    return 0
  }
  return numberOfHopsHelper(n)
}

func numberOfHopsHelper(_ n: Int) -> Int {
  var result = 0
  if n < 0 {
    result = 0
  } else if n == 0 {
    result = 1
  } else {
    result = numberOfHopsHelper(n - 1) + numberOfHopsHelper(n - 2) + numberOfHopsHelper(n - 3)
  }
  print("returning", result, "for", n)
  return result
}
