const fs = require('fs');
const path = '/evolution/src/api/services/monitor.service.ts';
let content = fs.readFileSync(path, 'utf8');

// Fix undefined property access on line 328
content = content.replace(
  /configService\.get<(\w+)>\('(\w+)'\)\.ENABLED/g,
  "configService.get<$1>('$2')?.ENABLED"
);

fs.writeFileSync(path, content);
console.log('Patch applied successfully');
