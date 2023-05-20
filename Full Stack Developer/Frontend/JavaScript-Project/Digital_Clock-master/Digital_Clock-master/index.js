// create variable to call the id element in HTML ile
const hoursE1 = document.getElementById("hour");
const minutesE1 = document.getElementById("minute");
const secondsE1 = document.getElementById("second");
const ampmE1 = document.getElementById("ampm");


// create function to call time, and procces variable from HTML file in real-time 
function updateClock (){
    // create variable to get real time 
    let h  = new Date().getHours();
    let m = new Date().getMinutes();
    let s = new Date().getSeconds();
    let ampm = "AM";

    // create logic, if h more than 12 so the am/pm change follow the rule time 
    if(h>12){
        h=h-12;
        ampm = "PM";
    }

    // create new number to company single number in time display
    h = h<10 ? "0" + h : h;
    m = m<10 ? "0" + m : m;
    s = s<10 ? "0" + s : s;

    // call the real-time variable and put it in HTML file
    hoursE1.innerText = h;
    minutesE1.innerText = m;
    secondsE1.innerText = s;
    ampmE1.innerText = ampm;

    // past number to display time, after 1 seconds fade out and change with new number
    setTimeout(()=>{
        updateClock()}
    , 1000)
}

// call the function to work in HTML file
updateClock();
