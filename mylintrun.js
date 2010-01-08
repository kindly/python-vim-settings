load("/home/david/.vim/fulljslint.js");
 
var body = arguments[0];
 
var result = JSLINT(readFile(body));

if (JSLINT.errors.length === 0){
    print("ok");
}

for (i = 0; i < JSLINT.errors.length; i++){
     error = JSLINT.errors[i];
     print([arguments[0],
            error.line,
            error.character,
            error.reason,
            error.evidence].join(","));
} 


