const fs = require('fs');
const path = '/evolution/src/api/services/monitor.service.ts';
let content = fs.readFileSync(path, 'utf8');

const lines = content.split('\n');
console.log('=== Lines 324-332 BEFORE patch ===');
lines.slice(323, 332).forEach((l, i) => console.log(i + 324, ':', l));

const before = content;
content = content.replace(/\)\.ENABLED/g, ')?.ENABLED');

const changed = (before !== content);
console.log('=== Changes made:', changed, '===');

fs.writeFileSync(path, content);

const newLines = content.split('\n');
console.log('=== Lines 324-332 AFTER patch ===');
newLines.slice(323, 332).forEach((l, i) => console.log(i + 324, ':', l));
