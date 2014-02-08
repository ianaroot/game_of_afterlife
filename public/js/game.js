var canvas = document.getElementsByTagName('canvas')[0];
var width = canvas.width
var height = canvas.height
var ctx = canvas.getContext('2d');

function updatePosition(){
  var newX = this.x + this.xOffset;
  if (newX < 0) {
    this.x = width + newX;
  } else if (newX > width) {
    this.x = newX - width;
  } else {
    this.x = newX;
  }
  var newY = this.y + this.yOffset;
  if (newY < 0) {
    this.y = height + newY;
  } else if (newY > height) {
    this.y = newY - height;
  } else {
    this.y = newY;
  }
}

function Humanoid(x,y){
  this.x = x;
  this.y = y;
}

Humanoid.prototype.updatePosition = updatePosition.bind(Humanoid.prototype)

function Zombie(x,y){
  this.x = x;
  this.y = y;
  this.color = '#ff0000'
  this.xOffset = 20
  this.yOffset = 20
}

Zombie.prototype.updatePosition = updatePosition

function Human(x,y){
  this.x = x
  this.y = y
  this.color = '#00aaaa'
}

function draw(player){
  ctx.beginPath();
  ctx.arc(player.x,player.y,5,0,2*Math.PI);
  ctx.fillStyle = player.color;
  ctx.fill();
  ctx.stroke();
}

var ian = new Human(10,10)
var david = new Zombie(100,100)

var players = [ian, david]

function drawNew(){
  ctx.clearRect(0,0,width,height)
  for (var i = 0; i < players.length; i++) {
    draw(players[i])
  }
}

function update(){
  david.updatePosition()
  ian.x += 4
  ian.y += 6
  drawNew()
}

drawNew()
for (var i = 0; i<50; i++){
  setTimeout(update, 50*i)
}