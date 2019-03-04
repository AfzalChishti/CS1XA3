var string1 = document.getElementById("str1");
var string2 = document.getElementById("str2");

var p1 = document.querySelector("#p1");
var p2 = document.querySelector("#p2");

string1.addEventListener("keyup", function(){
    p1.textContent = string1.value;
})

string2.addEventListener("keyup", function(){
    p2.textContent = string2.value;
})

