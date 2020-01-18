const clockContainer = document.querySelector(".js-pic"),
 one = document.querySelector(".one");

const IMG_NUMBER = 13;


function paintImages(imgNumber) {
    const image = new Image();
    image.src = `images/${imgNumber + 1}.jpg`;
    image.classList.add("bgImage");
    one.appendChild(image);
}

function genRandom() {
    const number = Math.floor(Math.random() * 13);
    return number;
}

function init() {
    const randomNumber = genRandom();
    paintImages(randomNumber);
}
init();