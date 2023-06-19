func findLargestIncreasingSubsequence(_ nums: [Int]) -> [Int] {
    let n = nums.count
    var dp = Array(repeating: 1, count: n)
    var previousIndices = Array(repeating: -1, count: n)
    
    for i in 1..<n {
        for j in 0..<i {
            if nums[j] < nums[i] && dp[j] + 1 > dp[i] {
                dp[i] = dp[j] + 1
                previousIndices[i] = j
            }
        }
    }
    
    var maxLength = dp[0]
    var maxIndex = 0
    for i in 1..<n {
        if dp[i] > maxLength {
            maxLength = dp[i]
            maxIndex = i
        }
    }
    
    var result: [Int] = []
    while maxIndex != -1 {
        result.append(nums[maxIndex])
        maxIndex = previousIndices[maxIndex]
    }
    
    return result.reversed()
}
findLargestIncreasingSubsequence([1, 2, 3, 2, 7, 9, 10, 11, 3])
