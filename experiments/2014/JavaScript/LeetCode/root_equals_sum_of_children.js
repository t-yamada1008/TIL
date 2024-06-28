// Root Equals Sum of Children

/**
 * You are given the root of a binary tree that consists of exactly 3 nodes: the root, its left child, and its right child.
 * Return true if the value of the root is equal to the sum of the values of its two children, or false otherwise.
 */

// 定義されたTreeNodeクラス（ツリーのノード）
class TreeNode {
    constructor(value = 0, left = null, right = null) {
      this.value = value;
      this.left = left;
      this.right = right;
    }
  }

  // ルートの値が子の合計に等しいかどうかをチェックする関数
  function checkTree(root) {
    // ルートの値
    const rootValue = root.value;

    // 左の子の値（nullチェックを含む）
    const leftValue = root.left ? root.left.value : 0;

    // 右の子の値（nullチェックを含む）
    const rightValue = root.right ? root.right.value : 0;

    // ルートの値が左右の子の値の合計と等しいかどうかを比較
    return rootValue === leftValue + rightValue;
  }

  // テストケース
  const root = new TreeNode(10, new TreeNode(4), new TreeNode(6));
  console.log(checkTree(root));  // true
