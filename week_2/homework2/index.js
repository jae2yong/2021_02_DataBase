const usernumber = document.getElementById("usernumber");
const slider = document.getElementById("js-range");
const output = document.getElementById("value");
const printForm = document.getElementById("user");
const display = document.getElementById("js-result");

output.innerHTML = slider.value;
slider.oninput = function(){
    output.innerHTML = this.value;
}
function randomRange(Max){
    return Math.floor(Math.random() * (Max + 1 ));
}

const handlePrint = (e) => {
    e.preventDefault();
    let nb = usernumber.value
    let sl = slider.value
    const diplaySpan = display.querySelector("span");

    function randomRange(){
        return Math.floor(Math.random() * ( sl + 1 )/10);
    }
    sl2 = randomRange();

    if (nb < sl2 ){
        diplaySpan.innerHTML = `You choose: ${nb}, the machine choose: ${sl2}<br><b>You Lost!</b>`
        
    }
    else if (nb > sl2){
        diplaySpan.innerHTML = `You choose: ${nb}, the machine choose: ${sl2}<br><b>You Win!</b>`
    }
};

 
printForm.addEventListener("submit", handlePrint);