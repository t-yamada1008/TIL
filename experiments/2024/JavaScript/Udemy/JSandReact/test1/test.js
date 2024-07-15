// Using var
var x = 10;
console.log(x); // Output: 10

// Using let
let y = 20;
console.log(y); // Output: 20

// Using const
const z = 30;
console.log(z); // Output: 30

// Reassigning values
x = 40;
y = 50;
// z = 60; // Uncommenting this line will result in an error

console.log(x); // Output: 40
console.log(y); // Output: 50
console.log(z); // Output: 30

// template literals
const name = 'Takatoshi';
const age = 35;

const massage = `My name is ${name} and I am ${age} years old.`;

console.log(massage); // Output: My name is Takatoshi and I am 35 years old.

// old way
const massage2 = 'My name is ' + name + ' and I am ' + age + ' years old.';
console.log(massage2); // Output: My name is Takatoshi and I am 35 years old.

// arrow functions
const add = (a, b) => { return a + b; }

console.log(add(5, 5)); // Output: 10

// old way
function add2(a, b) {
    return a + b;
}

console.log(add2(5, 5)); // Output: 10

// other way
const add3 = (a, b) => a + b;

console.log(add3(5, 5)); // Output: 10

// other way2
const square = a => a * a;

console.log(square(5)); // Output: 25

// default parameters
const add4 = (a, b = 5) => a + b;

console.log(add4(5)); // Output: 10

// old way
function add5(a, b) {
    b = b || 5;
    return a + b;
}

// spread operator
// ...numbers is the spread operator
const numbers = [1, 2, 3, 4, 5];

console.log(Math.max(...numbers)); // Output: 5

// old way
console.log(Math.max.apply(null, numbers)); // Output: 5

// separate the array
const [first, second, ...rest] = numbers;
console.log(first); // Output: 1

// destructuring assignment
const person = {
    name: 'Takatoshi',
    age: 35
};
// const name = person.name;
// const age = person.age;
// {} is the destructuring assignment

const massage3 = `My name is ${person.name} and I am ${person.age} years old.`;

// destructuring assignment pt.2
const person2 = ['Takatoshi', 35];
const message4 = `My name is ${person2[0]} and I am ${person2[1]} years old.`;

// {} is the destructuring assignment
const [name2, age2] = person2;
const message5 = `My name is ${name2} and I am ${age2} years old.`;

/**
 * default parameters(デフォルトパラメータ)
 */

const sayHello = (name) => console.log(`Hello ${name}!`);
sayHello('Takatoshi'); // Output: Hello Takatoshi!

const sayHello2 = (name = 'Takatoshi') => console.log(`Hello ${name}!`);
sayHello2(); // Output: Hello Takatoshi!

const person3 = {
    age3: 35
};

// gest is the default value
const {name3 = 'gest', age3} = person3;
console.log(`My name is ${name3} and I am ${age3} years old.`); // Output: My name is Takatoshi and I am 35 years old.
console.log(name3)
console.log(age3)

/**
 * オブジェクトの省略記法
 * Object Shorthand Notation
 */

const name4 = 'Takatoshi';
const age4 = 35;

const person4 = {
    name4: name4,
    age4: age4
};
console.log(person4); // Output: { name: 'Takatoshi', age: 35 }

// Object Shorthand Notation
const person5 = {
    name4,
    age4
};
console.log(person5); // Output: { name: 'Takatoshi', age: 35 }

/**
 * スプレッド構文
 * Spread Syntax
 */

// 配列の展開
// array expansion

const numbers2 = [1, 2, 3, 4, 5];
console.log(numbers2)
console.log(...numbers2) // Output: 1 2 3 4 5
console.log(Math.max(...numbers2)); // Output: 5

const sum = (a, b, c, d, e) => a + b + c + d + e;
console.log(sum(...numbers2)); // Output: 15

const add6 = (a, b) => a + b;
const numbers3 = [1, 2];

add6(numbers3[0], numbers3[1]); // Output: 3
add6(...numbers3); // Output: 3

/**
 * 配列のコピー
 * Array Copy
 */

const numbers4 = [1, 2, 3, 4, 5];
const numbers5 = numbers4.slice(); // slice()メソッドでコピー
const numbers6 = [...numbers4]; // スプレッド構文でコピー

// bad example
const numbers7 = numbers4; // 参照渡し

/**
 * 参照渡しと値渡し
 * Pass by Reference and Pass by Value
 */

// 参照渡し
const numbers8 = [1, 2, 3, 4, 5];
const copy = numbers8;
copy.push(6);
console.log(numbers8); // Output: [1, 2, 3, 4, 5, 6]

// 値渡し
let a = 5;
let b = a;
b = 10;
console.log(a); // Output: 5

/**
 * mapメソッド
 * map() Method
 */

const numbers9 = [1, 2, 3, 4, 5];
const doubled = numbers9.map((number) => number * 2);
console.log(doubled); // Output: [2, 4, 6, 8, 10]

// old way
const doubled2 = [];
for (let i = 0; i < numbers9.length; i++) {
    doubled2.push(numbers9[i] * 2);
}

/**
 * filterメソッド
 * filter() Method
 */

const numbers10 = [1, 2, 3, 4, 5];
const evens = numbers10.filter((number) => number % 2 === 0);
console.log(evens); // Output: [2, 4]

// old way
const evens2 = [];
for (let i = 0; i < numbers10.length; i++) {
    if (numbers10[i] % 2 === 0) {
        evens2.push(numbers10[i]);
    }
}

// other way
// return is optional
const evens3 = numbers10.filter((number) => {
    return number % 2 === 0;
});

const indexValuePairs = numbers10.map((value, index) => `Index: ${index}, Value: ${value}`);
console.log(indexValuePairs);

const oddIndexValuePairs = numbers10
    .map((value, index) => ({ index, value }))
    .filter(pair => pair.value % 2 !== 0)
    .map(pair => `Index: ${pair.index}, Value: ${pair.value}`);
console.log(oddIndexValuePairs);

/**
 * reduceメソッド
 * reduce() Method
 * reduce(callback, initialValue)
 *
 * callack is a function that takes four arguments
 * accumulator, currentValue, currentIndex, sourceArray
 * accumulator is the value returned by the last invocation of the callback
 * initialValue is the initial value of the accumulator
 * if initialValue is not provided, the first element of the array will be used as the initial value
 * reduce() returns the accumulated value
 */

const oddIndexValuePairs2 = numbers10.reduce((result, number, index) => {
    if (number % 2 !== 0) {
        result.push(`Index: ${index}, Value: ${number}`);
    }
    return result;
}, []);
console.log(oddIndexValuePairs);

const numbers11 = [1, 2, 3, 4, 5];
const sum2 = numbers11.reduce((accumulator, currentValue) => accumulator + currentValue, 0);
console.log(sum2); // Output: 15

// old way
let sum3 = 0;
for (let i = 0; i < numbers11.length; i++) {
    sum3 += numbers11[i];
}

/**
 * findメソッド
 * find() Method
 */

const numbers12 = [1, 2, 3, 4, 5];
const found = numbers12.find((number) => number > 2);
console.log(found); // Output: 3

// old way
let found2;
for (let i = 0; i < numbers12.length; i++) {
    if (numbers12[i] > 2) {
        found2 = numbers12[i];
        break;
    }
}

/**
 * findIndexメソッド
 * findIndex() Method
 */

const numbers13 = [1, 2, 3, 4, 5];
const foundIndex = numbers13.findIndex((number) => number > 2);
console.log(foundIndex); // Output: 2

// old way
let foundIndex2;
for (let i = 0; i < numbers13.length; i++) {
    if (numbers13[i] > 2) {
        foundIndex2 = i;
        break;
    }
}

/**
 * 三項演算子
 * Ternary Operator
 */

const age5 = 35;
const message6 = age5 >= 18 ? 'Adult' : 'Child';
console.log(message6); // Output: Adult

// old way
let message7;
if (age5 >= 18) {
    message7 = 'Adult';
}
else {
    message7 = 'Child';
}

/**
 * please enter a number method
 * prompt() is not available in Node.js
 * prompot is available in the browser
 */

// const input = prompt('Please enter a number: ');
// const number = Number(input);
// const message8 = isNaN(number) ? 'Not a number' : 'Number';
// console.log(message8);

/**
 * 論理演算子
 * Logical Operators
 */

const age6 = 35;
const isAdult = age6 >= 18 && 'Adult';
console.log(isAdult); // Output: Adult

const age7 = 35;
const isAdult2 = age7 >= 18 || 'Adult';
console.log(isAdult2); // Output: true

/**
 * 短絡評価
 * Short-Circuit Evaluation
 */

const age8 = 35;
const isAdult3 = age8 >= 18 && 'Adult';
console.log(isAdult3); // Output: Adult


