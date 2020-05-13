<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="/css/menu.css">
<link rel="stylesheet" href="/css/button-style.css">
<link rel="stylesheet" href="/css/ham-menu1.css">
<script>
    window.onscroll = function() {
        scrollFunction()
    };
    /*스크롤 내리면 메뉴 작아짐*/
    var width = $("#wrapper").width();
 
	function scrollFunction() {
		if (document.body.scrollTop > 80
				|| document.documentElement.scrollTop > 80) {
			document.getElementById("navbar").style.padding = "3px 10px";
			$("#navbar_login").children().css("font-size","17px");
		} else {
			document.getElementById("navbar").style.padding = "20px 10px";
			$("#navbar_login").children().css("font-size","20px");
		}
	}
	/*메뉴 등장*/
	function openNav() {
		if (document.getElementById("mySidepanel").style.width == "280px") {
			document.getElementById("mySidepanel").style.width = "0px";
			document.getElementById("mySidepanel").style.border = "0";
		} else {
			document.getElementById("mySidepanel").style.width = "280px";
			document.getElementById("mySidepanel").style.border = "2.5px solid #E4E8EB";
		}
	}

	var images = [ 'logo1.png', 'logo2.png', 'logo3.png', 'logo4.png',
			'logo5.png', 'logo6.png' ];
	$(function() {
		$("#navbar_logo").mouseenter(function() {
			$(this).css("cursor", "pointer");
		});
		$("#navbar_logo").click(function() {
			location.href = "/index.jsp";
		});
		$('#line-wrapper').click(function() {
			$('.line').removeClass('init');
			$('#line-top').toggleClass('line-top').toggleClass('top-reverse');
			$('#line-mid').toggleClass('line-mid').toggleClass('mid-reverse');
			$('#line-bot').toggleClass('line-bot').toggleClass('bot-reverse');
		});
		$("#content").click(function() {
			if (Number($("#mySidepanel").width()) == 275) {
				console.log($("#mySidepanel").width());
				$("#line-wrapper").trigger("click");
			}
		});
		/*이미지 랜덤*/
        
        var num = Math.floor(Math.random() * 1000);
        var check = 0;
        if (num >= 0 && num < 300) {
            check = 0;
        } else if (num < 600) {
            check =4;
        } else if (num < 900) {
            check =5;
        } else if (num < 930) {
            check =1;
        } else if (num < 960) {
            check =2;
        } else {
            check =3;
        }
		$("#navbar_logo").css(
				{
					'background-image' : 'url(/img/'
							+ images[check]
							+ ')'
				});
	});
</script>
<style>

</style>
    <div id="header">
        <div id="navbar">
            <div id="navbar_menu">
                <div id="wrapper_menu">
                    <div id="line-wrapper" href="javascript:void(0)" class="closebtn" onclick="openNav()">
                        <!-- 추가된 부분 -->
                        <div id="line-top" class="line init top-reverse" style="background-color:#545454;"></div>
                        <div id="line-mid" class="line init mid-reverse" style="background-color:#545454;"></div>
                        <div id="line-bot" class="line init bot-reverse" style="background-color:#545454;"></div>
                    </div>
                    <div id="mySidepanel" class="sidepanel">
                        <a href="#" class="openbtn">소개</a>
                        <a href="#" class="openbtn">번개장터</a>
                        <a href="#" class="openbtn">디저트</a>
                        <a href="#" class="openbtn">커뮤니티</a>
                        <a href="#" class="openbtn">놀이터</a>
                        <a href="#" class="openbtn">F&A</a>
                    </div>

                </div>
            </div>
            <div id="navbar_logo">
            </div>
            <div id="navbar_login">
                <span style="font-size:20px;"><a href="#" style="text-decoration:none; color:#545454;">로그인</a></span>
                <span style="font-size:20px;"><a href="#" style="text-decoration:none; color:#545454;">회원가입</a></span>
            </div>
        </div>
    </div>
