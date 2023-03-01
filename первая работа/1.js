function register(str) {
    if (!str) return str;
    let newString = str.toLowerCase()
    return newString[0].toUpperCase() + newString.slice(1);
}


function splitString(str) {
    if (!str) return str;
    str = str.split('.').join('. ');
    str = str.replace(/ +/g, ' ').trim();
    return str;
}



function WordsString(str){

    let counter = 1;

    
    str = str.replace(/ +/g, ' ').trim();

    
    str.replace(/(\s+)/g, function (a) {
       
       counter++;
    });

    return counter;
}




function wordsCount(str){

let words = str.split(" ");
let wordsCount = words.reduce(function (acc, w) {
  if(acc[w]) {
    acc[w] += 1
  } else {
    acc[w] = 1;
  }
 
  return acc;
}, {});
 
for (var w in wordsCount) console.log('Cлово "%s" встречается %d раз', w, wordsCount[w]);
return true;
}
console.log(wordsCount("Среди концов мы наконец нашли конец мы мы мы мы мы наконец и это был конец"))
