var xDegOld = 0;
var yDegOld = 0;
var xDegNew = 0;
var yDegNew = 0;
var xCoordNew = 0;
var yCoordNew = 0;
var screenWidth = document.querySelector("body").clientWidth;
console.log(screenWidth)
var screenHeight = document.querySelector("body").clientHeight;
console.log(screenHeight)
var cube = document.getElementById("container__animation");

function degDetermination(){
  xDegOld = xDegNew;
  yDegOld = yDegNew;
  xDegNew = - (-180 + yCoordNew / screenHeight * 360) / 4;
  yDegNew = (-180 + xCoordNew / screenWidth * 360) / 4;
};

function cubeMovement(){
    degDetermination();
    cube.animate([
      { transform: "rotateX(" + xDegOld + "deg) rotateY(" + yDegOld + "deg)" }, 
      { transform: "rotateX(" + xDegNew + "deg) rotateY(" + yDegNew + "deg)" }
    ], { 
      duration: 10,
    });
    cube.style.transform = "rotateX(" + xDegNew + "deg) rotateY(" + yDegNew + "deg)"
  };

document.getElementById('back').textContent = "gl --> /mxr5_g4M3s_th4n_yxu_exp5cted.html"  

window.addEventListener("mousemove", function(e){
  xCoordNew = e.clientX;
  yCoordNew = e.clientY;
  cubeMovement();
});