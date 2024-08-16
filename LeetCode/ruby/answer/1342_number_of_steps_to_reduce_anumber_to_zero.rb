# 1342. Number of Steps to Reduce a Number to Zero

# Given an integer num, return the number of steps to reduce it to zero.
# In one step, if the current number is even, you have to divide it by 2, otherwise, you have to subtract 1 from it.

# Example 1:

# Input: num = 14
# Output: 6

# Explanation:
# Step 1) 14 is even; divide by 2 and obtain 7.
# Step 2) 7 is odd; subtract 1 and obtain 6.
# Step 3) 6 is even; divide by 2 and obtain 3.
# Step 4) 3 is odd; subtract 1 and obtain 2.
# Step 5) 2 is even; divide by 2 and obtain 1.
# Step 6) 1 is odd; subtract 1 and obtain 0.

# Example 2:

# Input: num = 8
# Output: 4

# Explanation:
# Step 1) 8 is even; divide by 2 and obtain 4.
# Step 2) 4 is even; divide by 2 and obtain 2.
# Step 3) 2 is even; divide by 2 and obtain 1.
# Step 4) 1 is odd; subtract 1 and obtain 0.

# Example 3:

# Input: num = 123
# Output: 12

# Constraints:
# 0 <= num <= 10^6

# @param {Integer} num
# @return {Integer}

def number_of_steps(num)
  steps = 0
  while num > 0
	if num.even?
	  num /= 2
	else
	  num -= 1
	end
	steps += 1
  end
  steps
end

# 解説
# - number_of_steps関数は、整数numを引数として受け取り、0にするためのステップ数を返します。
# - steps変数を初期化してステップ数をカウントします。
# - whileループ内で、numが0になるまで繰り返します。
# 	- numが偶数なら2で割り、奇数なら1を引きます。
# 	- ステップをカウントします。
# - 最終的にステップ数を返します。
# このコードは、与えられた整数を0にするために必要なステップ数を正確に計算します。
