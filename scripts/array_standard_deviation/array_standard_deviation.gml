/// @description  double array_standard_deviation(array);
/// @param array
// the author is not responsible for any damages that may occur
// as a result of using this on an array that includes strings
// instead of numbers

var n=array_length_1d(argument0);
var sum=array_sum(argument0);

if (n==0){
    return 0;
}

var amean=sum/n;
var nvariance=0;

for (var i=0; i<n; i++){
    // i'm pretty sure calculating standard deviation does not
    // care if the value is positive or negative
//    if (argument0[i]>0){
        nvariance=nvariance+sqr(argument0[i]-amean);
//    }
}

return sqrt(nvariance/n);
