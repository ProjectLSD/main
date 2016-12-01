<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<style>
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
<div align="center">
<h2 style="color: white;">Registration of the album</h2>
<hr />
<br/>
<br/>
<form action="/file/upload" method="post" enctype="multipart/form-data">

		<table>
			<tr>
				<th>
					<div class="panel panel-default"
						style="width: 550px; height: 480px; background-color:#4c4949; border:2px;">
						<div class="panel-heading" style="background-color:#4c4949">
							<h4>
								<b>앨범 장르</b>
							</h4>
							<div class="form-group" style="padding-bottom: 5px;">
								<select name="genre" class="form-control" style="background-color:#d0c6c6; border:2px;">
									<option value="">장르 선택</option>
									<option value="pop">Pop</option>
									<option value="rock">Rock</option>
									<option value="jazz">Jazz</option>
									<option value="hiphop">HipHop</option>
									<option value="country">Country</option>
									<option value="electronic">Electronic</option>
								</select>
							</div>
							<h4>
								<b>앨범명</b>
							</h4>
							<input type="text" class="form-control" id="album"
								placeholder="일범명 입력 50자 이하" name="album" maxlength="50"
								size="1px;" style="background-color:#d0c6c6; border:2px;"> <br /> <span id="albumtxt"
								style="color: red;" ></span>
							<h4>
								<b>등록할 앨범</b>
							</h4>
							<div align="right" class="filebox bs3-primary" >
								<input class="upload-name" value="등록할 앨범선택" disabled="disabled"
									style="width: 370px; background-color:#d0c6c6; border:2px;"><label for="ex_filename" >업로드</label>
								<input type="file" id="ex_filename" class="upload-hidden"
									accept="audio/*" name="file">
							</div>
							<div>
								<div id="imgPick">
								<h4>
									<b>앨범 이미지</b>
								</h4>
								<div align="right" class="filebox bs3-primary  preview-image">
									<input class="upload-name" value="등록할 이미지 선택"
										disabled="disabled" style="width: 370px; background-color:#d0c6c6; border:2px;"> <label
										for="input_file">업로드</label> <input type="file"
										id="input_file" class="upload-hidden" accept="image/*"
										name="image">
								</div>
								</div>
								<br />
								<hr />
								<button type="button" class="btn  btn-default  pull-left"
									data-dismiss="modal" onclick="location.href='/'">
									<span class="glyphicon glyphicon-remove"></span> 취소
								</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

								<button class="btn  btn-default " type="reset">
									<span class="glyphicon glyphicon-repeat"></span> 다시작성
								</button>
								<input class="btn  btn-default pull-right" type="submit"
									value="올리기" />
							</div>
				</th>
			</tr>
		</table>
	</div>
</form>


<script>
	$("#album").blur(function() {
		var id = $(this).attr("id");
		var album = $("input[name='album']").val();
		$.ajax({
			"url" : "/file/checkAlbum?album=" + album,
			"method" : "get",
			"aSync" : true
		}).done(function(txt) {
			if (txt == "TRUE") {
				$("#imgPick").hide(2000);
				$("#albumtxt").text("등록된앨범이라 음원만 추가 등록됩니다.");
			} else {
				$("#imgPick").show(2000);
			}

		})
	});
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
	$(document).ready(
			function() {
				var fileTarget = $('.filebox .upload-hidden');

				fileTarget.on('change', function() {
					if (window.FileReader) {
						var filename = $(this)[0].files[0].name;
					} else {
						var filename = $(this).val().split('/').pop().split(
								'\\').pop();
					}

					$(this).siblings('.upload-name').val(filename);
				});
			});
</script>