const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


function teaOrBiscuits () {
  reader.question("Do you like tea?", function (firstAns) {
    console.log(firstAns);
    reader.question("Do you like biscuits?", function (secondAns) {
      console.log(secondAns);

      const first = (firstAns === 'yes') ? 'do' : 'don\'t';
      const second = (secondAns === 'no') ? 'don\'t' : 'do';

      console.log(`You ${first} want tea and you ${second} want coffee`);
      reader.close();
    });
  });
}

console.log(`HELLLLOOOO`);
