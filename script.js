const socket = io();


function send(){

let input=document.getElementById("msg");

socket.emit("chat message",input.value);

input.value="";

}


socket.on("chat message",(msg)=>{

let li=document.createElement("li");

li.innerText=msg;

document.getElementById("messages")
.appendChild(li);

});
