
const blob = new Blob([svg], { type: 'image/svg+xml' });

const p = URL.createObjectURL(blob);
console.log(p);