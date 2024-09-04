const fs = require('fs');
const { exit } = require('process');

// Some settings
const MAX_CELL_COUNT = 30000;
const MAX_CELL_VALUE = 255;

if (process.argv.length < 3) {
    console.log('No brainfuck file specified');
    console.log(`Usage: node brainfuck.js encode.bf "Your text to encode"`);
    exit(1);
}
if (process.argv.length < 4) {
    console.log('No input string specified');
    console.log(`Usage: node brainfuck.js encode.bf "Your text to encode"`);
    exit(1);
}

const brainfuckFileLocation = process.argv[2];

const inputString = Array.from(process.argv.slice(3).join(' '));
console.log(`Input:`, inputString);

let brainfuckCode = fs.readFileSync(brainfuckFileLocation, 'utf8');

brainfuckCode = Array.from(brainfuckCode);
brainfuckCode = brainfuckCode.filter((v) => {
    return ['.', ',', '[', ']', '<', '>', '+', '-', '?'].includes(v);
})

function runBrainfuck(brainfuckArray) {
    const cells = [0];
    let cellPointer = 0;

    for (let i = 0; i < brainfuckArray.length; i++) {
        let command = brainfuckArray[i];

        if (command === '>') {
            cellPointer += 1;
            if (cellPointer >= MAX_CELL_COUNT) {
                throw new Error(`Cell pointer out of bounds at index ${cellPointer}, max cell count is ${MAX_CELL_COUNT}`);
            }
            if (cellPointer === cells.length) {
                cells.push(0);
            }
        } else if (command === '<') {
            cellPointer -= 1;
            if (cellPointer < 0) {
                throw new Error(`Cell pointer out of bounds at index ${cellPointer}`)
            }
        } else if (command === '+') {
            cells[cellPointer]++;
            if (cells[cellPointer] > MAX_CELL_VALUE) {
                cells[cellPointer] = 0;
            }
        } else if (command === '-') {
            cells[cellPointer]--;
            if (cells[cellPointer] < 0) {
                cells[cellPointer] = MAX_CELL_VALUE;
            }
        } else if (command === '[') {
            if (cells[cellPointer] === 0) {
                let depth = 1;
                for (let j = i+1; j < brainfuckArray.length; j++) {
                    let nestedCommand = brainfuckArray[j];
                    if (nestedCommand === '[') {
                        depth++;
                    } else if (nestedCommand === ']') {
                        depth--;
                    }
                    if (depth === 0) {
                        i = j;
                        break;
                    }
                }
                if (depth !== 0) {
                    throw new Error(`Missing closing bracket for opening bracket at index ${i}`);
                }
            }
        } else if (command === ']') {
            let depth = 1;
            for (let j = i-1; j >= 0; j--) {
                let nestedCommand = brainfuckArray[j];
                if (nestedCommand === ']') {
                    depth++;
                } else if (nestedCommand === '[') {
                    depth--;
                }
                if (depth === 0) {
                    i = j - 1;
                    break;
                }
            }
            if (depth !== 0) {
                throw new Error(`Missing opening bracket for closing bracket at index ${i}`);
            }
        } else if (command === '.') {
            process.stdout.write(String.fromCodePoint(cells[cellPointer]));
        } else if (command === ',') {
            cells[cellPointer] = inputString.length > 0 ? inputString.shift().codePointAt() % MAX_CELL_VALUE : 13;
        } else if (command === '?') {
            console.log('\n\nDebug:\n', cells, `\nPointer index: ${cellPointer}`, `\nCell value at pointer: ${cells[cellPointer]}\n`);
        }
    }
}

runBrainfuck(brainfuckCode);


// this is very shitty code but I just wanna have minimized versions of the brainfuckery to post on discord
if (!brainfuckFileLocation.startsWith('minimized')) {
    let minimizedFileName = `${brainfuckFileLocation.slice(0, -3)}.min.bf`;
    let minimizedBrainfuck = brainfuckCode.join('');

    if (!fs.existsSync('minimized')) {
        fs.mkdirSync('minimized');
    }
    fs.writeFileSync(`minimized/${minimizedFileName}`, minimizedBrainfuck);
}