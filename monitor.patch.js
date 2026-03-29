const fs = require('fs');
const filePath = './src/api/services/monitor.service.ts';

// Read the actual file
const content = fs.readFileSync(filePath, 'utf8');
const lines = content.split('\n');

// Print lines around 328
for (let i = 320; i < 335; i++) {
  console.log(`${i + 1}: ${lines[i]}`);
}
