// script.js
const cells = document.querySelectorAll('[data-cell]');
let turn = 'X';

function handleClick(e) {
  // クリックしたセルにxかoを入れる
  const cell = e.target;
  cell.textContent = turn;

  // ターンの切り替え
  turn = turn === 'X' ? 'O' : 'X';
}

cells.forEach(cell => {
  cell.addEventListener('click', handleClick, { once: true });
});

// 勝利条件
const winConditions = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
];

// 勝利判定
function checkWin() {
  return winConditions.some(condition => {
    return condition.every(index => {
      return cells[index].classList.contains(currentPlayer)
    });
  });
}

// 引き分け判定
function endGame(draw) {
  if (draw) {
    message.textContent = 'Draw!';
    return;
  }
  message.textContent = `${currentPlayer} wins!`;
}

// ゲーム状態の更新
if (checkWin()) {
  endGame(false);
} else if (isDraw()) {
  endGame(true);
} else {
  swapTurns();
}

// ターンの切り替え
function swapTurns() {
  currentPlayer = currentPlayer === 'X' ? 'O' : 'X';
}

// 引き分け判定
function isDraw() {
  return [...cells].every(cell => {
    return cell.classList.contains('X') || cell.classList.contains('O');
  });
}

// リセット
function handleRestart() {
  cells.forEach(cell => {
    cell.textContent = '';
  });
  currentPlayer = 'X';
  message.textContent = '';
}

// リスタートボタン
const restartButton = document.querySelector('#restart');
restartButton.addEventListener('click', handleRestart);

// プレイヤー
let currentPlayer = 'X';
const message = document.querySelector('#message');