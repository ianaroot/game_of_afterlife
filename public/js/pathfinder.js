var Pathfinder = {
  moveTowards: function(friendlyLocation, currentPosition, speed){
    var deltaY = location.y - currentPosition.y;
    var deltaX = location.x - currentPosition.x;
    var length = distanceTo(friendlyLocation);
    if (speed > 0 && length < speed){
      return friendlyLocation
    } else {
      return {'x': ((position.x + deltaX)/length * speed),'y': ((position.y + deltaY)/length * speed)}
    }
  },
    
  movePerpendicularTo: function(location, currentPosition, speed){
  var deltaY = location.y - currentPosition.y;
    var deltaX = location.x - currentPosition.x;
    var length = distanceTo(friendlyLocation);
    if (speed > 0 && length < speed){
      return friendlyLocation
    } else {
      return {'x': ((position.x + deltaX)/length * speed),'y': ((position.y - deltaY)/length * speed)}
    }
  },

  moveAwayFrom: function(hostileLocation, speed){
    moveTowards(hostileLocation, -speed);
  },

  distanceTo: function(targetLocation, currentPosition){
    var deltaY = targetLocation.y - currentPosition.y;
    var deltaX = targetLocation.x - currentPosition.x;
    return Math.pow(Math.sqrt(deltaY),2) + Math.pow(Math.sqrt(deltay),2)
  },

  moveRandomly: function(){
    angle = Math.random() * 2 * Math.PI;
      return {'x': (position.x + Math.cos(angle) * speed),'y': (position.y + Math.sin(angle) * speed)}
  },
}