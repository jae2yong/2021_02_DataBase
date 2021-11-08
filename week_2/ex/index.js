const usernumber = document.getElementById("usernumber");
const machine = document.getElementById("js-range");
const printForm = document.getElementById("user");
const display = document.getElementById("js-result");


const handlePrint = (e) => {
    e.preventDefault();
    const nb = usernumber.value
    const diplaySpan = display.querySelector("span");
    diplaySpan.innerHTML = `
    You choose: ${nb}, the machine choose:<br> `;
    if(nb < 10){
        diplaySpan.innerHTML = `
        You choose: ${nb}, the machine choose:<br>\nYou Win! `;
    }
    else{
        diplaySpan.innerHTML = `
        You choose: ${nb}, the machine choose:<br>\nYou Lost! `;
    }
};
printForm.addEventListener("submit", handlePrint);