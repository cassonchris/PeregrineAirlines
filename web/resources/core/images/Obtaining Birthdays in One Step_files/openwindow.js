function OpenWindow(url, form, win) {
  // usage:
  //    to submit a form, url parameter should be ""
  //    to open a specific url, form parameter should be ""


  if (url == "") { // we are submitting a form
win = "_blank";
    form.target = win;
    form.submit();
  } else {
win = "";
    var wind = window.open(url, win);
    if (wind == null) {
      alert("You have enabled a pop-up blocker that is preventing you from getting the maximum benefit from this site.");
      self.top.document.location = url;
    }
  }

  /* old version -- raises permission error on lastest update to IE

  var url2 = (url == "") ? "about:blank" : url; // blank url means we are submitting a form
  if (win == "") {
    win = "_blank";
  }
  var wind = window.open(url2, win);
  if (wind != null) {
    if (url == "") { // we are submitting a form
      form.target = win;
      form.submit();
    }
    wind.focus();
  } else { // pop-up blocker prevented us from opening a new window
   alert("You have enabled a pop-up blocker that is preventing you from getting the maximum benefit from this site.");
   if (url == "") { // we are submitting a form
      form.target = "_top";
      form.submit();
    } else {
      self.top.document.location = url2;
    }
  }

  */

}
