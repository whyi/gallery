app.filter('partition', function() {
  var part = function(arr, size) {
    if ( 0 === arr.length ) return [];
    return [ arr.slice( 0, size ) ].concat( part( arr.slice( size ), size) );
  };
  return part;
});