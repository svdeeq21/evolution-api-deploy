const fs = require('fs');
const filePath = './src/api/services/monitor.service.ts';
let content = fs.readFileSync(filePath, 'utf8');

content = content.replace(
  /configService\.get<Chatwoot>\('CHATWOOT'\)\.ENABLED/g,
  "configService.get<Chatwoot>('CHATWOOT')?.ENABLED"
);

fs.writeFileSync(filePath, content);
console.log('Patch applied to monitor.service.ts');
