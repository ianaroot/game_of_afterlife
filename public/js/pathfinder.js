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

  moveAwayFrom: function(hostileLocation, speed){
    moveTowards(hostileLocation, -speed);
  },
  
}