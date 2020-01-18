const youtubeForm = document.querySelector(".js-youtubeForm"),
	youtubeLi = document.querySelector(".youTubeLi");
	
const divForm = document.querySelector(".js-pic"),
	divBasic = document.querySelector(".youtubeDiv"),
	imageLi = document.querySelector(".one");
	imageText = document.querySelector(".visual_inner");


const CLICKDIV_CLASS1 = "youtubeDiv2";
const CLICKDIV_CLASS2 = "youtubeDiv";
const CLICKLI_CLASS1 =	"one";
const CLICKLI_CLASS2 =	"two";
const CLICKTEXT_CLASS1 ="visual_inner";
const CLICKTEXT_CLASS2 ="visual_inner2";

function MakeYoubue() {
	 divBasic.classList.toggle(CLICKDIV_CLASS1);
	 divBasic.classList.toggle(CLICKDIV_CLASS2);
	 imageLi.classList.toggle(CLICKLI_CLASS1);
	 imageLi.classList.toggle(CLICKLI_CLASS2);
	 imageText.classList.toggle(CLICKTEXT_CLASS1);
	 imageText.classList.toggle(CLICKTEXT_CLASS2);
	 
}

function init() {
	youtubeLi.addEventListener("click", MakeYoubue);
}
init();