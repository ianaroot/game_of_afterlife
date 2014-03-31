var Humanoid = function(attributes){
  this.position = attributes.position || {'x': (5+ Math.floor(Math.random()*791)),'y': (5+ Math.floor(Math.random()*791))};
  this.speed = attributes.speed;
  this.humanType = attributes.humanType; //may be removed in favor of class inheritence
  this.timeSinceInfection = 0 // time since infection may be moved to infected zombie class 
  this.lastPosition = this.position;
}

Humanoid.prototype = {
  isAttractedTo: function(nearestObject){
    return nearestObject.humanType === 'human';
    // nearestObject instanceOf Human
  },

  storeLastPosition: function(){
    this.lastPosition = {'x': this.position.x, 'y': this.position.y};
  },

  isLastMoveRepeated: function(potentialMove){
    return (Math.abs(potentialMove.x - this.lastPosition.x) && Math.abs(potentialMove.y - this.lastPosition.y));
  },

  getBitten: function(){
    this.humanType = 'infectedHuman'
    //this.__proto__ = InfectedHuman.prototype
    this.speed = 0
  },

  bite: function(humanoid){
    if (humanoid.humanType === 'human'){
    // if (humanoid instanceOf Human){
      humanoid.getBitten();
    }
  },

  turnToZombie: function(){
    this.type = 'zombie'
    // this.__proto__ = Zombie.prototype
    this.speed = 5
  },

  isAbleToBite: function(){
    return this.type === 'zombie';
    // return this instanceOf Zombie
  },

  incrementTimeSinzeInfection: function(){
    this.timeSinceInfection ++;
    if (this.timeSinceInfection === 5){
      this.turnToZombie();
    }
  },

  moveNearest: function(nearestObject){
    if (this.isAttractedTo()){
      var potentialMove = this.moveTowards(nearestObject.position, this.speed)
    } else {
      var potentialMove = this.moveAwayFrom(nearestObject.position, this.speed)
    }

    this.storeLastPosition();
    if (this.lastPosition === this.position){
      moveRandomly();
    } else if (isLastMoveRepeated(potentialMove)){
      movePerpendicularTo(nearestObject.position, this.speed)
    } else {
      return potentialMove
    }
  },
}