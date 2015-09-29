var deviceId ;
var gcmId;
var platform = "";
var pushNotification;
var AdMob;
var REST = 'http://www.makemypublicity.com/';
var ad_category = 0; 
var admobid = {};

//var REST = 'http://192.168.0.107/'

var app = angular.module('DesiKitchen', ['ionic','ionic-material']);

app.config(function($controllerProvider,$ionicConfigProvider) {
  app.controllerProvider = $controllerProvider;
  $ionicConfigProvider.views.maxCache();
});

app.filter('range', function() {
  return function(input, total) {
    total = parseInt(total);
    for (var i=0; i<total; i++)
      input.push(i);
    return input;
  };
});

app.run(function($ionicPlatform, $rootScope, $location, $timeout) {


  $ionicPlatform.registerBackButtonAction(onBackKeyDown, 100);

  function onBackKeyDown() {
    if($location.path() === '/kitchen/category'){
      //adbuddiz.showAd();
      navigator.app.exitApp();
    }else{
      // navigator.app.backHistory();
       window.history.go(-1);
    }
 }

 // function adbuddiz_setup(){
 //  adbuddiz.setAndroidPublisherKey("412dbc62-8c70-4de4-88f1-f5ad4208fb23");
 //  adbuddiz.cacheAds();
 // }

 function admob_setup(){
  AdMob = window.AdMob;
  admobid = {
    // banner: 'ca-app-pub-5711807847149998/4306002269',
    // interstitial: 'ca-app-pub-5711807847149998/6840666264'
    banner: 'ca-app-pub-1473424661437460/6213169435',
    interstitial: 'ca-app-pub-1473424661437460/7689902633'
  };
  $timeout(function(){
    if(window.localStorage.getItem("deviceid") == "8fb1c956dca5eb78"){
      AdMob.setOptions({isTesting: true, overlay: true});  
    }
    AdMob.setOptions({overlay: true});
    AdMob.prepareInterstitial( {adId:admobid.interstitial, autoShow:true} );    
  }, 2000);

  // AdMob.createBanner({
  //   adId: admobid.banner, 
  //   position: AdMob.AD_POSITION.BOTTOM_CENTER, 
  //   overlap: false,
  //   autoShow: true });
 }

  function push_notification(){
        pushNotification = window.plugins.pushNotification;

        if (device.platform == 'android' || device.platform == 'Android') {
            window.localStorage.setItem("deviceid", device.uuid);
            pushNotification.register(
                successHandler,
                errorHandler, {
                    "senderID": "421561710829",
                    "ecb": "onNotification"
                });
        }  
  }

  function check_connection(){
    if(navigator.connection.type == Connection.NONE) {
        window.plugins.toast.show('You are not connected to internet.', 'long', 'center', function(a){console.log('toast success: ' + a)}, function(b){alert('toast error: ' + b)});      
        $timeout(function(){
            navigator.app.exitApp();
        }, 2000);        
    }
  }
        


  $ionicPlatform.ready(function() {
    check_connection();
    window.analytics.startTrackerWithId('UA-65927807-1');
    push_notification();
    admob_setup();
    //adbuddiz_setup();
  });
})

function successHandler(result) {
    console.log('result = ' + result);
}

function errorHandler(error) {
    console.log('error = ' + error);
}

function onNotification(e) {

    switch (e.event) {
        case 'registered':
            if (e.regid.length > 0) {
            window.localStorage.setItem("gcmid", e.regid);
            }
            break;

        case 'message':
            if(e.message == "Tip of The Day"){
            window.localStorage.setItem("its", "tip");  
            }
        case 'error':
            console.log('PUSHPLUGIN Error' + e.msg);
            break;

        default:
            console.log('PUSHPLUGIN: Unknown, an event was received and we do not know what it is');
            break;
    }

}

// app.directive('ionSpinner', function() {
//   return {
//     restrict: 'E',
//     controller: '$ionicSpinner',
//     link: function($scope, $element, $attrs, ctrl) {
//       var spinnerName = ctrl.init();
//       $element.addClass('spinner spinner-' + spinnerName);
//     }
//   };
// });

