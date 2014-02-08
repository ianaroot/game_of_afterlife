var canvas = document.getElementsByTagName('canvas')[0];
var width = canvas.width
var height = canvas.height
var ctx = canvas.getContext('2d');

function updatePosition(){
  var newX = this.x + this.Offset
  if (newX < 0) {
    this.x = width + this.Offset
  } else if (newX > width) {
    console.log("do this later")
  }
}

function Zombie(x,y){
  this.x = x
  this.y = y
  this.color = '#ff0000'
  this.Xoffset = -5
}

Zombie.prototype.updatePosition = updatePosition.bind(Zombie.prototype)

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
for (var i = 0; i<20; i++){
  setTimeout(update, 100*i)
}