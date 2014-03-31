describe("Humanoid", function(){
  var human;

  describe("A human", function(){

    beforeEach(function(){
      human = new Humanoid({'speed': 10, 'humanType': 'human'});
    });

    it("should have a speed of 10", function(){
      expect(human.speed).toEqual(10)
    });

    it("should have a humanType of human", function(){
      expect(human.humanType).toEqual('human')
    });

    it("should have a default lastPosition equal to position", function(){
      expect(human.lastPosition).toEqual(human.position)
    });

    it("should have a timeSinceInfection equal to 0", function(){
      expect(human.timeSinceInfection).toEqual(0)
    });

    describe("#isAttractedTo", function(){

      it("should be attracted to a human", function(){
        anotherHuman = new Humanoid({'speed': 10, 'humanType': 'human'});
        expect(human.isAttractedTo(anotherHuman)).toEqual(true)
      })
    })
  });
});