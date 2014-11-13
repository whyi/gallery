app = angular.module 'gallery'

class ArtCarouselController extends BaseController
  @register app, "ArtCarouselController"

  @inject '$scope'
 
  # initialize the controller
  initialize: ->
    @$scope.slides = []
    @$scope.slides.push({text: 'text1', image: 'http://www.whyi.net/hyunju/img/slide-1.jpg'})
    @$scope.slides.push({text: 'text2', image: 'http://www.whyi.net/hyunju/img/slide-2.jpg'})
    @$scope.slides.push({text: 'text3', image: 'http://www.whyi.net/hyunju/img/slide-3.jpg'})
    @$scope.slides.push({text: 'text4', image: 'http://www.whyi.net/hyunju/img/slide-4.jpg'})
    @$scope.slides.push({text: 'text5', image: 'http://www.whyi.net/hyunju/img/slide-5.jpg'})
    @$scope.myInterval = 5000;
