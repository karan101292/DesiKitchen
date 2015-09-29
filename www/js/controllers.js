app.controller('CategoryCtrl',['$scope','$http','$location','$state','$timeout','$ionicPlatform','$ionicModal', '$ionicSlideBoxDelegate', function($scope, $http, $location,$state,$timeout,$ionicPlatform, $ionicModal, $ionicSlideBoxDelegate) {
  //$('#loader_div').show();
  
  $scope.categories = {};

  var fab = document.getElementById('fab-gallery');
  if(fab != null){
     $timeout(function () {
              fab.classList.toggle('on');
          }, 300);  
  }  

  $timeout(function(){
    if(window.localStorage.getItem("its") == "tip"){
      $state.go('kitchen.tip',{});
      return;
    }
  },1000);

  $timeout(function(){
    // if(ad_category == 0){
    //   //adbuddiz.showAd();
    //   //AdMob.showInterstitial();
    //   ad_category = 1;  
    // }
    
    get_user();
  }, 5000);
  

  var user="";
  $http.get(REST+'DesiKitchen/functions.php',{
      params:{
        function: 'get_category'
      }
    }).
      error(function(data){
          //window.plugins.toast.show('Something went wrong. Please restart the application.', 'long', 'bottom', function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)});  
        }).
      success(function(data) {
       $scope.categories = data.cat[0];
      });


      function create_user(user){
        if(user=="false"){
          $http.get(REST+'DesiKitchen/functions.php?function=create_user', {params:{
            deviceid:deviceid,
            gcmid: gcmid
          }  
          }).
            error(function(data){
              $('#loader_div').fadeOut();
            }).
            success(function(data) {
              if(data != "false"){
                window.localStorage.removeItem("user_id");
                window.localStorage.setItem("user_id", data);
                window.plugins.toast.show('You are now a registered user of DesiKitchen. Kindly complete your profile.', 'long', 'bottom', function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)});  
              }
          });  
        }else{
          window.localStorage.removeItem("user_id");
          window.localStorage.setItem("user_id", user);
        } 
      }

      function get_user(){
        deviceid = window.localStorage.getItem("deviceid"); //'8fb1c956dca5eb78';
        gcmid = window.localStorage.getItem("gcmid");

        $http.get(REST+'DesiKitchen/functions.php',{
          params:{
            function: 'get_user',
            deviceid: deviceid,
            gcmid: gcmid
          }
        }).
          error(function(data){
              //alert('Something went wrong. Kindly restart application.');
            }).
          success(function(data) {
            user = data.user[0];
            create_user(user);
          });

      }
      

      $scope.choose_category = function(cat_id,cat_name){
        window.localStorage.setItem("catname", cat_name);
        $state.go('kitchen.dish_list',{cat_id:cat_id});
      }

}]);


app.controller('DishListCtrl',['$scope','$http','$location','$stateParams','$state','$timeout', function($scope, $http, $location,$stateParams,$state, $timeout) {
  //$('#loader_div').show();
  
  $scope.catname = window.localStorage.getItem("catname");
  $scope.dishes = {};                  
  var fab = document.getElementById('fab-gallery-list');
  if(fab != null){
     $timeout(function () {
              fab.classList.toggle('on');
          }, 300);  
  }

  var cat_id = $stateParams.cat_id;
  $http.get(REST+'DesiKitchen/functions.php',{
      params:{
        function: 'get_dishes',
        category_id: cat_id
      }
    }).
      error(function(data){
          //$('#loader_div').fadeOut();
          alert('Something went wrong. Try again.');
        }).
      success(function(data) {
       $scope.dishes = data;
       //$('#loader_div').fadeOut();

        $timeout(function(){
          AdMob.createBanner({
            adId: admobid.banner, 
            position: AdMob.AD_POSITION.BOTTOM_CENTER, 
            overlap: true,
            autoShow: true 
          });
        },2000);

      });

      $scope.choose_dish = function(dish_id){
        $state.go('kitchen.dish_info',{dish_id:dish_id});
      }
}]);


app.controller('DishInfoCtrl',['$scope','$http','$location','$stateParams','$state','$timeout','$ionicModal', '$ionicSlideBoxDelegate','$sce', function($scope, $http, $location,$stateParams,$state,$timeout ,$ionicModal, $ionicSlideBoxDelegate,$sce) {
  //$('#loader_div').show();
  $scope.dish_info = {};
  $ionicModal.fromTemplateUrl('templates/all_comments.html', {
    scope: $scope
  }).then(function(modal) {
    $scope.comments_modal = modal;
  });

  userid = window.localStorage.getItem("user_id");
  $scope.comment = {};

  $scope.renderHtml = function(html){
    return $sce.trustAsHtml(html);
  };
  
  var dish_id = $stateParams.dish_id;
  $http.get(REST+'DesiKitchen/functions.php',{
      params:{
        function: 'get_dish_info',
        dish_id: dish_id,
        userid: userid
      }
    }).
      error(function(data){
          //$('#loader_div').fadeOut();
          alert('Sorry! unable to fetch topics');
        }).
      success(function(data) {
       $scope.dish_info = data.info[0][0];
       $scope.ingredients = $scope.dish_info.ingredients.split(',');
       $scope.comments = data.comments[0];
       $scope.comment_text = _.pluck($scope.comments, 'comment');
       $scope.like_status = data.likes[0];
       $scope.fav_status = data.favourites[0];
       
       $timeout(function () {
        $scope.dishname = $scope.dish_info.name;                  
      }, 500); 
       //$('#loader_div').fadeOut();
      });

      

      $scope.post_like = function(){
        $http.get(REST+'DesiKitchen/functions.php?function=post_like', {params:{
          dish_id: dish_id,
          userid: userid
        }}).
          error(function(data){
              window.plugins.toast.show('Something went wrong. Try again liking', 'long', 'bottom', function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)});    
          }).
          success(function(data) {  
            //$('#loader_div').fadeOut();
            if(data == "true"){
              $scope.like_status = true;
            }else{
              window.plugins.toast.show('Something went wrong. Try again liking', 'long', 'bottom', function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)});
            }
        });  
      }

      $scope.post_dislike = function(){
        $http.get(REST+'DesiKitchen/functions.php?function=post_dislike', {params:{
          dish_id: dish_id,
          userid: userid
        }}).
          error(function(data){
              window.plugins.toast.show('Something went wrong. Try again disliking', 'long', 'bottom', function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)});    
          }).
          success(function(data) {  
            //$('#loader_div').fadeOut();
            if(data=="true"){
              $scope.like_status = false;
            }else{
              window.plugins.toast.show('Something went wrong. Try again disliking', 'long', 'bottom', function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)});
            }
        });  
      }

      $scope.post_comment = function(){

        if($scope.comment.text == null || $scope.comment.text == ''){
          window.plugins.toast.show('Write comment and hit that button again.', 'long', 'bottom', function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)});      
          return;
        }
        $scope.comment.dish_id = $scope.dish_info.id;
        //$('#loader_div').show();
        $http.get(REST+'DesiKitchen/functions.php?function=post_comment', {params:{
          dish_id: $scope.comment.dish_id,
          userid: userid,
          comment: $scope.comment.text 
        }}).
          error(function(data){
              window.plugins.toast.show('Something went wrong. Try again commenting', 'long', 'bottom', function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)});    
          }).
          success(function(data) {  
            //$('#loader_div').fadeOut();
            if(data=="true"){
              $scope.comment_text.unshift($scope.comment.text);
              $scope.comment.text = null;
            }else{
              window.plugins.toast.show('Something went wrong. Try again commenting', 'long', 'bottom', function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)});
            }
        });
      }

	    $scope.make_favourite = function(){
        $http.get(REST+'DesiKitchen/functions.php?function=make_favourite', {params:{
          dish_id: dish_id,
          userid: userid
        }}).
          error(function(data){
              window.plugins.toast.show('Something went wrong. Try again to make it favourite', 'long', 'bottom', function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)});    
          }).
          success(function(data) {  
            //$('#loader_div').fadeOut();
            if(data=="true"){
              $scope.fav_status = true;
            }else{
              window.plugins.toast.show('Something went wrong. Try again make it favourite', 'long', 'bottom', function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)});
            }
        });  
      }

      $scope.remove_favourite = function(){
          $http.get(REST+'DesiKitchen/functions.php',{
            params:{
              function: 'remove_favourites',
              user_id: userid,
              dish_id: dish_id
            }
          }).
            error(function(data){
                window.plugins.toast.show('Something went wrong. Try again.', 'long', 'bottom', function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)});    
              }).
            success(function(data) {
              $scope.fav_status = false;
              window.plugins.toast.show('Dish removed from favourites', 'long', 'bottom', function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)});        
            });
        }


        

      $ionicModal.fromTemplateUrl('image-modal.html', {
        scope: $scope,
        animation: 'slide-in-up'
      }).then(function(modal) {
        $scope.modal = modal;
      });

    $scope.openModal = function() {
      $scope.aImages = [{
        'src' : $scope.dish_info.image_url.toString(), 
        'msg' : ''
      }];
      $ionicSlideBoxDelegate.slide(0);
      $scope.modal.show();
    };

    $scope.closeModal = function() {
      $scope.modal.hide();
    };

    $scope.next = function() {
      $ionicSlideBoxDelegate.next();
    };
  
    $scope.previous = function() {
      $ionicSlideBoxDelegate.previous();
    };
  
    $scope.goToSlide = function(index) {
      $scope.modal.show();
      $ionicSlideBoxDelegate.slide(index);
    }
  
    // Called each time the slide changes
    $scope.slideChanged = function(index) {
      $scope.slideIndex = index;
    };


        

      $scope.show_all_comments = function(){
        $scope.comments_modal.show();
      }

      $scope.closeComments = function(){
        $scope.comments_modal.hide();
      }

      $scope.shareRecipe = function(){
        window.plugins.socialsharing.share('Hey, I found this recipe of '+ $scope.dishname +' on DesiKitchen. It is an awesome recipe app with awesome recipes. download it via playstore', null, null, 'https://play.google.com/store/apps/details?id=com.kkbhutwala.desikitchen')
      }
}]);

app.controller('FavouritesCtrl',['$scope','$http','$location','$stateParams','$state', function($scope, $http, $location,$stateParams,$state) {
        //$('#loader_div').show();
        var user_id = localStorage.getItem("user_id")

        $scope.get_favourites = function(){
          $http.get(REST+'DesiKitchen/functions.php',{
            params:{
              function: 'get_favourites',
              user_id: user_id
            }
          }).
            error(function(data){
                window.plugins.toast.show('Something went wrong. Try again.', 'long', 'bottom', function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)});    
                //$('#loader_div').fadeOut();  
            }).
            success(function(data) {
             $scope.favourites = data;
            });  
        }
        $scope.get_favourites();  

        $scope.choose_dish = function(dish_id){
          $state.go('kitchen.dish_info',{dish_id:dish_id});
        }

        // $scope.remove_favourite = function(dish_id){
        //   $http.get(REST+'DesiKitchen/functions.php',{
        //     params:{
        //       function: 'remove_favourite',
        //       user_id: user_id,
        //       dish_id: dish_id
        //     }
        //   }).
        //     error(function(data){
        //         window.plugins.toast.show('Something went wrong. Try again.', 'long', 'bottom', function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)});    
        //       }).
        //     success(function(data) {
        //       $scope.favourites = _.reject($scope.favourites, function(fav){ return fav.id  == dish_id; });
        //       window.plugins.toast.show('Dish removed from favourites', 'long', 'bottom', function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)});        
        //     });
        // }


      }]);

app.controller('HomeCtrl',['$scope','$http','$location','$stateParams','$state','$ionicModal', '$ionicSlideBoxDelegate', function($scope, $http, $location,$stateParams,$state,$ionicModal, $ionicSlideBoxDelegate) {
        //$('#loader_div').show();
        $scope.user_id = window.localStorage.getItem("user_id");

      }]);


app.controller('ProfileCtrl',['$scope','$http','$location','$stateParams','$state','$timeout', function($scope, $http, $location,$stateParams,$state,$timeout) {
        //$('#loader_div').show();
        user_id = window.localStorage.getItem("user_id");
        $scope.profile = {};


        $scope.get_pofile = function(){
          $http.get(REST+'DesiKitchen/functions.php',{
            params:{
              function: 'get_profile',
              user_id: user_id
            }
          }).
            error(function(data){
              window.plugins.toast.show('Something went wrong. Try again.', 'long', 'bottom', function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)});    
              //$('#loader_div').fadeOut();
            }).
            success(function(data) {             
             $scope.profile.fname = data.fname;
             $scope.profile.lname = data.lname;
             $scope.profile.mobile = parseInt(data.mobile);
             $scope.profile.gender = data.gender;
             $timeout(function(){
              AdMob.showInterstitial();
            },2000);
             //$('#loader_div').fadeOut();
            });  
        }  
        

        $scope.get_pofile();
        $scope.save = function(){
        $('#loader_div').show();  
          if($scope.profile.fname == null || $scope.profile.lname == null || $scope.profile.gender == null || $scope.profile.fname == '' || $scope.profile.lname == '' || $scope.profile.gender == ''){
          window.plugins.toast.show('All the fields are mandatory.', 'long', 'bottom', function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)});    
          return;
        }

        $http.get(REST+'DesiKitchen/functions.php',{
            params:{
              function: 'save_profile',
              user_id: user_id,
              fname: $scope.profile.fname,
              lname: $scope.profile.lname,
              gender: $scope.profile.gender,
              mobile: $scope.profile.mobile
            }
          }).
            error(function(data){
              window.plugins.toast.show('Something went wrong. Try again.', 'long', 'bottom', function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)});    
              $('#loader_div').fadeOut();  
            }).
            success(function(data) {
             if(data=="true"){
                $('#loader_div').fadeOut();
                window.plugins.toast.show('Thanks for updating your profile.', 'long', 'bottom', function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)});    
             }else{
                $('#loader_div').fadeOut();
                window.plugins.toast.show('Something went wrong. Try again.', 'long', 'bottom', function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)});    
             }
            });  
        }
        
}]);


app.controller('FeedbackCtrl',['$scope','$http','$location','$stateParams','$state','$timeout', function($scope, $http, $location,$stateParams,$state,$timeout) {
        userid = window.localStorage.getItem("user_id");
        $scope.feedback = {};

        $timeout(function(){
          AdMob.showInterstitial();
        },2000);

        $scope.add_feedback = function(){
          $('#loader_div').show();
          if($scope.feedback.text == null || $scope.feedback.text == ''){
            window.plugins.toast.show('Write feedback and hit that button again', 'long', 'bottom', function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)});    
            return;
          }

          $http.get(REST+'DesiKitchen/functions.php', {params:{
          function: 'add_feedback', 
          feedback: $scope.feedback.text,
          userid: userid
        }}).
          error(function(data){
              $('#loader_div').fadeOut();
              window.plugins.toast.show('Something went wrong. Try again to make it favourite', 'long', 'bottom', function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)});    
          }).
          success(function(data) {  
            $('#loader_div').fadeOut();
            if(data=="true"){
              $scope.feedback.text = null;
              window.plugins.toast.show('Thank you for your feedback.', 'long', 'bottom', function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)});
            }else{
              window.plugins.toast.show('Something went wrong. Try again make it favourite', 'long', 'bottom', function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)});
            }
        });
      }
}]);

app.controller('TipsCtrl',['$scope','$http','$location','$stateParams','$state','$filter','$timeout', function($scope, $http, $location,$stateParams,$state,$filter,$timeout) {
        //$('#loader_div').show();

        window.localStorage.removeItem("its");
        $scope.user_id = window.localStorage.getItem("user_id");
        $scope.bgs = {0:'#A0CFEC', 1:'#81D8D0', 2:'#E0FFFF', 3:'#54C571', 4:'#FFF380', 5:'#FFE5B4', 6:'#FDD7E4', 7:'#B041FF', 8:'#99C68E',9:'#8AE3C0'};
        
        $scope.set_bg = function(){
          var key = Math.round(Math.random()*10) + 1;
          return bgs[key];
        }

        $http.get(REST+'DesiKitchen/functions.php',{
          params:{
            function: 'get_tips'
          }
        }).
          error(function(data){
              //window.plugins.toast.show('Something went wrong. Please restart the application.', 'long', 'bottom', function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)});  
            }).
          success(function(data) {
           $scope.tips = data.tips[0];
            $timeout(function(){
              AdMob.showInterstitial();
            },2000);
          });


}]);


