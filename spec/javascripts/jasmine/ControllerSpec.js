#=require angular-mocks
describe("Player", function() {
  var $scope, ctrl;

  //you need to indicate your module in a test
  beforeEach(module('myApp'));
  beforeEach(inject(function($rootScope, $controller) {
    $scope = $rootScope.$new();
    ctrl = $controller('homeCtrl', {
      $scope: $scope
    });
  }));
  
  it('should say hallo to the World', function() {
    expect($scope.posts).toEqual('World');
  });

});

describe('AngularDemo controllers', function() {

	it('easy test', function() {
		expect(1).toBe(1);
	});
  
});

