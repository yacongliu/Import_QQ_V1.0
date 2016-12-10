<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<!--声明当前页面编码集-->
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<!--声明当前页面三要素-->
<title>Java开发腾讯大数据批量导入系统</title>
<meta name="keyword" content="java开发, 数据批量导入">
<meta name="description" content="">
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

body {
	font-size: 12px;
	font-family: "微软雅黑";
	color: #666666;
}
/*h1 start*/
h1 {
	font-size: 24px;
	line-height: 100px;
	text-align: center;
	font-weight: 600;
}
/*end h1*/

/*content start*/
.content {
	width: 800px;
	/*height:500px;border:1px solid red; */ /*高度由内容决定*/
	margin: 0 auto;
}

.content          .c-btn {
	width: 140px;
	height: 40px;
	background: #66ccff;
	display: block;
	text-align: center;
	line-height: 40px;
	text-decoration: none;
	font-size: 14px;
	color: #ffffff;
	border-radius: 3px;
}

.content .c-btn:hover {
	background: #6699ff
}

.content .c-con {
	width: 800px;
	border-top: 1px solid #ececec;
	border-bottom: 1px solid #ececec;
	margin-top: 20px;
}

.content .c-con .c-list {
	margin: 20px 0;
}

.content .c-con .c-list:hover {
	background: #e6e6e6
}

.content .c-con .c-list p {
	font-size: 14px;
	line-height: 40px;
	padding-left: 12px;
}
/*end content*/
</style>
</head>
<body>
	<!--h1 start-->
	<h1>Java开发腾讯大数据批量导入系统[腾讯课堂后台管理核心技术]</h1>
	<!--end h1-->

	<!--content start-->
	<div class="content">
		<a href="#" class="c-btn">上传批量数据</a>
		<div class="showres"></div>
		<div class="c-con">
			<!-- <div class="c-list">
				<p>第一节课：太好了。。。</p>
				<p>第一节课描述：必须的</p>
			</div>
			<div class="c-list">
				<p>第一节课：太好了。。。</p>
				<p>第一节课描述：必须的</p>
			</div>
			<div class="c-list">
				<p>第一节课：太好了。。。</p>
				<p>第一节课描述：必须的</p>
			</div>
			<div class="c-list">
				<p>第一节课：太好了。。。</p>
				<p>第一节课描述：必须的</p>
			</div> -->
		</div>
	</div>
	<!--end content-->

	<!-- js -->
	<script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
	<script type="text/javascript">
		$(function() {
			console.info("ok")

			$(".c-btn").click(
					function() {
						$.ajax({
							type : "POST",
							url : "data.jsp",
							beforeSend:function(XMLHttpRequest){
								 $(".c-con").append("<div><img src='./images/loading.gif'/></div>"); 
							},
							complete(XMLHttpRequest, textStatus){
								alert("解析成功！");
							},
							success : function(data) {
								var jdata = eval("(" + data + ")");
								console.log(jdata);
								var html = "";
								for (var i = 0; i < jdata.length; i++) {
									console.info(jdata[i].title);
									console.info(jdata[i].desc);
									html += "<div class='c-list'>"
											+ " <p>第一节课名称："
											+ jdata[i].title + "</p>"
											+ " <p>第一节课描述："
											+ jdata[i].desc + "</p>"
											+ "</div>";
								}
								console.info(html);
								$(".c-con").html(html);
							}
						});
					});
		});
	</script>




</body>
</html>