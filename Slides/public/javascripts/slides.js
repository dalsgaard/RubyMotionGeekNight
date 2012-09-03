
var useHistory = true;

function getSlideIndex(count) {
  var parts = window.location.href.split('/');
  var index = parseInt(parts[parts.length - 1]);
  if (isNaN(index)) {
    index = 0;
    history.replaceState(index, null, window.location.href + "/" + index);
  } else if (index > count - 1) {
    index = count - 1;
    history.replaceState(index, null, index);
  }
  return index;
}

document.addEventListener('DOMContentLoaded', function() {

  console.log(useHistory);

  var section = document.querySelector("body > section");
  function resize() {
    section.style.height = "" + window.innerHeight + "px";
  }
  resize();
  window.addEventListener('resize', resize);


  var slides = document.querySelectorAll("article.slides > *");
  var slideIndex = (useHistory) ? getSlideIndex(slides.length) : 0;
  console.log(slideIndex);
  function arrangeSlides() {
    for (var l = slides.length, i = 0; i < l; i++) {
      var slide = slides[i];
      var offset = (i - slideIndex) * 100;
      slide.style.left = "" + offset + "%";
    }
  }
  function previousSlide() {
    if (slideIndex > 0) {
      slideIndex--;
      if (useHistory) {
        history.pushState(slideIndex, null, slideIndex);
      }
      arrangeSlides();
    }
  }
  function nextSlide() {
    if (slideIndex < slides.length - 1) {
      slideIndex++;
      if (useHistory) {
        history.pushState(slideIndex, null, slideIndex);
      }
      arrangeSlides();
    }
  }
  document.addEventListener('keyup', function(e) {
    switch (e.keyCode) {
      case 37:
        previousSlide();
        break;
      case 39:
        nextSlide();
        break;
    }
  }, false);
  arrangeSlides();

  window.addEventListener('popstate', function(e) {
    if (e.state !== null) {
      slideIndex = e.state;
    }
    arrangeSlides();
  }, false);

}, false);