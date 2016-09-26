<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Travel Way</title>
  <link rel="stylesheet" href="../css/home.css">
  <meta name="viewport" content="width=device width, initial scale=1.0,maximum-scale1,user-scalable=no">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="HandheldFriendly" content="true">
</head>
<body>
    <form id="form1" runat="server">
  <header>
    <div class="img">
        <img id="head" src="head.png" height="100px"/>
    </div>

    <div class="box">
      <div class="container-1">
        </div>
    </div>
    <div class="logo">
      <img src="logo.png" width="170em" height="170em"/>
    </div>
    <div class="bar">
    <nav class="horizontalbar">
      <ul class="list">
        <li><a href="Home.aspx">Home</a></li>
        <li><a href="Explore.aspx">Explore</a></li>
        <li><a href="About.aspx">About</a></li>
        <li><a href="Contact.aspx">Contact</a></li>
      </ul>
    </nav>
  </div>

  <div class="buttons">
      <asp:Label ID="lblInfo" runat="server"></asp:Label>
        <asp:TextBox ID="tbxYourMail" class="tbxMails" runat="server" placeholder="Your Mail"></asp:TextBox>
<%--        <asp:TextBox ID="tbxYourPassword"  class="tbxMails" runat="server" type="password" placeholder="Your Password"></asp:TextBox>
        <asp:Button id="btnContinue"  class="btn" runat="server"  Text="Continue" OnClick="continuing"/>    --%>
        <asp:TextBox id="tbxSubject"  class="tbxMails" runat="server" visible="true" placeholder="Subject"></asp:TextBox>
      <br />  
      <asp:TextBox ID="tbxBody"  class="tbxMails" runat="server"  visible="true"  placeHolder="Message" ></asp:TextBox>
        <asp:Button id="btnSend"  class="btn" runat="server"  visible="true"  Text="Send" OnClick="SendMail"/>
    <%--<button class="btn"><a href="Login.aspx" style="color:darkgrey; text-decoration:none;">Login</a></button>
    <button class="btn"><a href="Registration.aspx" style="color:darkgrey;text-decoration:none">Signup</a></button>--%>
  </div>

    <div class="slideshow-container">
      <div class="slides fade">
        <img src="img1.jpg" style="width:100%"/>
        <div class="text">Explore the world</div>
      </div>

      <div class="slides fade">
        <img src="img2.jpg" style="width:100%"/>
        <div class="text">Travel as far as you can</div>
      </div>

      <div class="slides fade">
        <img src="img3.jpg" style="width:100%">
        <div class="text">Live endless memories</div>
      </div>

      <div class="slides fade">
        <img src="img4.jpg" style="width:100%">
        <div class="text">Escape the ordinary</div>
      </div>

      <div class="slides fade">
        <img src="img5.jpg" style="width:100%">
        <div class="text">Fill life with adventure</div>
      </div>

      <div class="slides fade">
        <img src="img6.jpg" style="width:100%">
        <div class="text">Walk in the woods</div>
      </div>

      <div class="slides fade">
        <img src="img7.jpg" style="width:100%">
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
    //function continuing()
    //{
    //    tbxYourMail.visible = false;
    //    tbxYourPassword.visible = false;
    //    btnContinue.visible = false;
    //    tbxSubject.visible = true;
    //    tbxBody.visible = true;
    //    btnSend.visible = true;

    //}
    </script>
  </header>
  <article>
    <div id="back"></div>
    <div>
        <img id="i1" src="places.png" alt=""/>
      </div>
      <div>
        <img id="i2" src="hotel.png" alt=""/>
      </div>
      <div>
        <img id="i3" src="food.png" alt=""/>
    </div>
    <div class="area">
      <div>
        <h1>Once you have travelled the voyage never ends. The mind can never break off from the journey.</h1>
      </div>
    </div>
  </article>
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












<%--<asp:Label ID="lblInfo" runat="server"></asp:Label>
        <asp:TextBox ID="tbxYourMail" runat="server" placeholder="Your Mail"></asp:TextBox>
        <asp:TextBox ID="tbxYourPassword" runat="server" type="password" placeholder="Your Password"></asp:TextBox>
        <asp:TextBox id="tbxSubject" runat="server" placeholder="Subject"></asp:TextBox>
        <asp:TextBox ID="tbxBody" runat="server" placeHolder="Message" ></asp:TextBox>
        <asp:Button id="btnSend" runat="server" Text="Send" OnClick="SendMail"/>--%>