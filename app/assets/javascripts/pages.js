window.addEventListener("turbolinks:load",function(){
  const params = location.search;

  //エリアパラメーターを持っている場合、スクロール
  if( params.split("=")[0] == "?area"){
    const scrollObject = document.getElementById("site-area-info");
    const objTop = scrollObject.offsetTop;
    scrollTo(0, objTop );
  }
  $(function () {
    $('img[usemap]').rwdImageMaps();
  })
});