app.config(function($stateProvider, $urlRouterProvider) {

  $stateProvider

    .state('kitchen', {
    url: "/kitchen",
    abstract: true,
    templateUrl: "templates/kitchen.html",
    controller: 'HomeCtrl'
  })

  .state('kitchen.category', {
    url: '/category',
    cache: false,
    views: {
      'kitchen': {
        templateUrl: 'templates/category.html',
        controller: 'CategoryCtrl'
      }
    }
  })

  .state('kitchen.dish_list', {
    url: '/dish_list/:cat_id',
    cache: false,
    views: {
      'kitchen': {
        templateUrl: 'templates/dish_list.html',
        controller: 'DishListCtrl'
      }
    }
  })

  .state('kitchen.dish_info', {
    url: '/dish_info/:dish_id',
    cache: false,
    views: {
      'kitchen': {
        templateUrl: 'templates/dish_info.html',
        controller: 'DishInfoCtrl'
      }
    }
  })

  .state('kitchen.favourites', {
    url: '/favourites',
    cache: false,
    views: {
      'kitchen': {
        templateUrl: 'templates/favourites.html',
        controller: 'FavouritesCtrl'
      }
    }
  })

  .state('kitchen.profile', {
    url: '/profile/:user_id',
    cache: false,
    views: {
      'kitchen': {
        templateUrl: 'templates/profile.html',
        controller: 'ProfileCtrl'
      }
    }
  })

  .state('kitchen.feedback', {
    url: '/feedback',
    cache: false,
    views: {
      'kitchen': {
        templateUrl: 'templates/feedback.html',
        controller: 'FeedbackCtrl'
      }
    }
  })

  .state('kitchen.tip', {
    url: '/tip',
    cache: false,
    views: {
      'kitchen': {
        templateUrl: 'templates/tip_of_the_day.html',
        controller: 'TipsCtrl'
      }
    }
  })

  // if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise('/kitchen/category');

});