function loadFlickr(flickrid)
{
// Display a loading icon in our display element
$('#feed').html('<span><img src="/blog/images/lightbox-ico-loading.gif" alt=""></span>');
// Request the JSON and process it
$.ajax({
type:'GET',
url:"http://api.flickr.com/services/feeds/photos_public.gne",
data:"id="+flickrid+"&lang=en-us&format=json&jsoncallback=?",
success:function(feed) {
// Create an empty array to store images
var thumbs = [];
// Loop through the items
for(var i=0, l=feed.items.length; i < l && i < 16; i)
{
// Process each image
}
// Display the thumbnails on the page
},
dataType:'jsonp'
});
}