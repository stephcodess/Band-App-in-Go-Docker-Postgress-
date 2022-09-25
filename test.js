// you can write to stdout for debugging purposes, e.g.
// console.log('this is a debug message');

function solution(A) {
  // write your code in JavaScript (Node.js 8.9.4)
  var N = A.length;
  var M = A[0].length;
  var testedNum = [];
  var ans = 0;
  for (var i = 0; i < N; i++) {
    var j = 1;
    while (j <= M) {
      if (!testedNum.includes(A[i][j - 1])) {
        if (A[i + 1]) {
          if (A[i + 1].includes(A[i][j - 1])) {
            ans += 1;
          }
        }
        testedNum.push(A[i][j - 1]);
      }

      j += 1;
    }
  }
  return ans;
}

console.log(solution([
    [1, 2, 4],
    [2, 3, 6],
  ])
  )