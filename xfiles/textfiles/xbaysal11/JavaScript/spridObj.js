const foo = { a: 1, b: 2 };
const obj = { c: 3, b: 3 };
const bar = Object.assign({}, obj, foo);
const baz = { ...obj, ...foo };
const { a, b, ...other } = baz;
console.log(bar, baz, other);
