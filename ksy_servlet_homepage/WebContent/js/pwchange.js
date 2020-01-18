const checkBox = document.querySelector(".cpCheck"),
	 checkBoxDiv = document.querySelector(".checkboxDiv"),
	 passwordDiv = document.querySelector(".passwordDiv");


const PASSWORDDIV = "passwordDiv"; //none
const CHECKBOXDIV = "checkboxDiv";
const CHECKBOXDIV2 = "checkboxDiv2"; //none


function showingPwInput() {
	checkBoxDiv.classList.toggle(CHECKBOXDIV);
	checkBoxDiv.classList.toggle(CHECKBOXDIV2);
	passwordDiv.classList.toggle(PASSWORDDIV);
}

function init() {
	checkBox.addEventListener("click", showingPwInput);
}
init();