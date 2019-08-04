function getSecondLargest(nums) {
    // Complete the function
    let f = nums[0];
    let s = nums[0];
    var i;
    for (i = 1; i < nums.length; i++) {
        if (nums[i] > f) {
            s = f
            f = nums[i];
        };
        if (nums[i] > s && nums[i] < f) {
            s = nums[i];
        };
    }
    return s
}


function main() {
    const n = +(readLine());
    const nums = readLine().split(' ').map(Number);

  
