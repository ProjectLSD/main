<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.btn-default {
	border: 2px;
	background: #23232c;
	color: #fff;
}

.btn-default:hover {
	background: #fff;
	color: #000;
}

body {
	margin: 10px;
}

.where {
	display: block;
	margin: 25px 15px;
	font-size: 11px;
	color: #000;
	text-decoration: none;
	font-family: verdana;
	font-style: italic;
}

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

/* named upload */
.filebox .upload-name {
	display: inline-block;
	padding: .5em .75em;
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}

.filebox .upload-display {
	margin-bottom: 5px;
}

@media ( min-width : 768px) {
	.filebox .upload-display {
		display: inline-block;
		margin-right: 5px;
		margin-bottom: 0;
	}
}

.filebox .upload-thumb-wrap {
	display: inline-block;
	width: 54px;
	padding: 2px;
	vertical-align: middle;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
}

.filebox .upload-display img {
	display: block;
	max-width: 100%;
	width: 100% \9;
	height: auto;
}

.filebox.bs3-primary label {
	color: #fff;
	background-color: #337ab7;
	border-color: #2e6da4;
}
</style>
<h2 style="color: white;">Posting</h2>
<hr />
<div align="center">
	<table>
		<tr>
			<th>
				<div class="panel panel-default" style="width: 550px; height: auto; border:2px;">
					<div class="panel-heading" style="background-color:#4c4949" >
						<form id="form1" name="form1" action="/bandNotice/reg"
							method="post" enctype="multipart/form-data">
							<h4>
								<b>The public image</b>
							</h4>
							<div align="right" class="filebox bs3-primary preview-image">
								<input class="upload-name" value="동영상 선택" disabled="disabled"
									style="width: 440px; background-color:#d0c6c6"> <label for="input_file">업로드</label>
								<input type="file" id="input_file" name="file" class="upload-hidden" accept="video/*"> 
							</div>


							<br />
							<div class="form-group">
								<h4>
									<b>Title</b>
								</h4>
								<input type="text" class="form-control" name="title" id="ti" maxlength="50"; placeholder="50글자 이하로 입력하세요" style="background-color:#d0c6c6">
							</div>
							<h4>
								<b>Introduced article</b>
							</h4>
							<textarea class="form-control" rows="5" name="text" id="ta" style="background-color:#d0c6c6" ></textarea>
							<br />
							<h4>
								<b>Location Register</b>
							</h4>
							<input id="location" name="location" type="text"
								class="form-control" style="width: 60%; background-color:#d0c6c6;" readonly="readonly" />
							<input id="px" name="px" type="hidden" class="form-control"
								style="width: 30%" /> <input id="py" name="py" type="hidden"
								class="form-control" style="width: 30%" />

							<div id="imgPick">
								<h4>
									<b>Search the place show.</b>
								</h4>
								<!-- 구글지도 START -->
								<input id="pac-input" class="controls" type="text"
									placeholder="공연 장소 입력" style="background-color:#d0c6c6">
								<div id="mapview" style="width: 60%; height: 50%;"></div>
								<!-- 구글지도 END -->
							</div>
							<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
							<!-- 지도 JS css -->
							<link rel="stylesheet" href="/css/map.css" />
							<br />
							<hr />

							<button class="btn  btn-default " type="reset">
								<span class="glyphicon glyphicon-repeat"></span> 다시작성
							</button>
							<input class="btn btn-default pull-right" type="submit" id="btn"
								value="올리기" />
						</form>
					</div>
			</th>
		</tr>
	</table>
</div>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAT0Mp7oBqIMB38egvlesA8j9uf6nYdEeE&libraries=places&callback=initAutocomplete"
	async defer></script>
<script type="text/javascript" src="/js/map.js"></script>
<script>
	$("#btn").click(function() {
		//$("#form1").attr("action");
		$("#form1").submit();
	});

	//===========================================
	// ckeditor
	var opt = {
		"height" : 300,
		"width" : 570
	};
	CKEDITOR.replace("ta");
	//====================================

	var x = document.getElementById("demo");
	function getLocation() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(showPosition);
		} else {
			x.innerHTML = "Geolocation is not supported by this browser.";
		}
	}
	function showPosition(position) {
		alert(position);
		x.innerHTML = "Latitude: " + position.coords.latitude
				+ "<br />Longitude: " + position.coords.longitude;
	}

	//====================================
	var src = {
		lat : 37.497942,
		lng : 127.02760
	};
	function initAutocomplete() {
		map(src, false);
	}

	$(document)
			.ready(
					function() {
						var fileTarget = $('.filebox .upload-hidden');

						fileTarget.on('change', function() {
							if (window.FileReader) {
								// 파일명 추출
								var filename = $(this)[0].files[0].name;
							}

							else {
								// Old IE 파일명 추출
								var filename = $(this).val().split('/').pop()
										.split('\\').pop();
							}
							;

							$(this).siblings('.upload-name').val(filename);
						});

						//preview image 
						var imgTarget = $('.preview-image .upload-hidden');

						imgTarget
								.on(
										'change',
										function() {
											var parent = $(this).parent();
											parent.children('.upload-display')
													.remove();

											if (window.FileReader) {
												//image 파일만
												if (!$(this)[0].files[0].type
														.match(/image\//))
													return;

												var reader = new FileReader();
												reader.onload = function(e) {
													var src = e.target.result;
													parent
															.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
												}
												reader
														.readAsDataURL($(this)[0].files[0]);
											}

											else {
												$(this)[0].select();
												$(this)[0].blur();
												var imgSrc = document.selection
														.createRange().text;
												parent
														.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

												var img = $(this).siblings(
														'.upload-display')
														.find('img');
												img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""
														+ imgSrc + "\")";
											}
										});
					});
</script>