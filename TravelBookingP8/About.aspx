<%@ Page Language="C#" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Travel Way</title>
  <link rel="stylesheet" href="../css/About.css">
  <meta name="viewport" content="width=device width, initial scale=1.0,maximum-scale1,user-scalable=no">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="HandheldFriendly" content="true">
</head>
<body>
    <form id="form1" runat="server">
  <header>
    <div class="img">
        <img id="head" src="../Images/head.png" height="100px"/>
    </div>
    <div class="box">
    </div>
    <div class="bar">
    <nav class="horizontalbar">
      <ul class="list">
        <li><a href="Home.aspx">Home</a></li>
        <li><a href="#">Explore</a></li>
        <li><a href="About.aspx">About</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
    </nav>
  </div>
        <article>
    <div id="back"></div>
    <div class="area">
      <div>
        <h1>The origin of the word "travel" is most likely lost to history. The term "travel" may originate from the Old French word travail.[3] According to the Merriam Webster dictionary, the first known use of the word travel was in the 14th century. It also states that the word comes from Middle English travailen, travelen (which means to torment, labor, strive, journey) and earlier from Old French travailler (which means to work strenuously, toil). In English we still occasionally use the words travail and travails, which mean struggle.</h1>
      </div>
    </div>
  </article>
    <div class="slideshow-container">
      <div class="slides fade">
        <img src="../Images/1.jpg" style="width:100%">
        <div class="text">Experience</div>
      </div>

      <div class="slides fade">
        <img src="../Images/2.jpg" style="width:100%">
        <div class="text">Class</div>
      </div>

      <div class="slides fade">
        <img src="../Images/3.jpg" style="width:100%">
        <div class="text">Memories</div>
      </div>

      <div class="slides fade">
        <img src="../Images/4.jpg" style="width:100%">
        <div class="text">Escape the ordinary</div>
      </div>

      <div class="slides fade">
        <img src="../Images/5.jpg" style="width:100%">
        <div class="text">Satisfaction</div>
      </div>

      <div class="slides fade">
        <img src="../Images/6.jpg" style="width:100%">
        <div class="text">Walk in the woods</div>
      </div>

      <div class="slides fade">
        <img src="../Images/7.jpg" style="width:100%">
        <div class="text">Never miss a journey</div>
      </div>

      <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
      <a class="next" onclick="plusSlides(+1)">&#10095;</a>
    </div>
    <script>
    var slideIndex= 0;
    showSlidesAutomatic();
    showSlides(slideIndex);

    function plusSlides(n){
      showSlides(slideIndex+=n);
    }

    function showSlides(n) {
      var i;
      var slides=document.getElementsByClassName("slides");
      if(n>slides.length)
      {slideIndex=1;}
      if(n<1)
      {slideIndex=slides.length;}
      for(i=0;i<slides.length;i++)
      {
        slides[i].style.display="none";
      }
      slides[slideIndex-1].style.display="block";
    }
    function showSlidesAutomatic() {
      var i;
      var slides=document.getElementsByClassName("slides");
      for(i=0;i<slides.length;i++)
      {
        slides[i].style.display="none";
      }
      slideIndex++;
      if(slideIndex>slides.length)
      {slideIndex=1;}
      slides[slideIndex-1].style.display="block";
      setTimeout(showSlidesAutomatic,5000);
    }
  </script>
  </header>
  <footer>
    <div class="wrap">
    <h1>Travel way</h1>
    <p>Feedback&nbsp&nbsp&#8226&nbsp&nbspTerms and conditions&nbsp&nbsp&#8226&nbsp&nbspPrivacy Policy</p>
    <h6>&#169; Copyrights 2016 travelway.com All Rights Reserved</h6>
  </div>
</footer>
</form>
</body>
</html>

