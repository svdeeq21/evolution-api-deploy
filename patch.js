const fs = require('fs');
const path = '/evolution/src/api/services/monitor.service.ts';
let content = fs.readFileSync(path, 'utf8');

const lines = content.split('\n');
console.log('Line 325-332:');
lines.slice(324, 332).forEach((l, i) => console.log(i + 325, l));

// Replace any .ENABLED with ?.ENABLED throughout monitor.service.ts
content = content.replace(/\)\.ENABLED/g, ')?.ENABLED');

fs.writeFileSync(path, content);
console.log('Patch applied');
