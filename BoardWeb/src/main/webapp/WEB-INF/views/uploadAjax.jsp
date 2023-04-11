<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<h3>Upload With Ajax</h3>
	<div class="uploadDiv">
		<input type="file" name="uploadFile" multiple>
	</div>
	<button id="uploadBtn">Upload</button>
	
	<script>
		$(document).ready(function () {
			// file type 체크
			var regex = new RegExp("\.(exe|sh|zip|alz)$");
			var maxSize = 5 * 2024 * 1024	
			
			function checkExtension(fileName, fileSize) {
				if (fileSize > maxSize) {
					alert('파일 크기 초과!!');
					return false;
				}
				if (regex.test(fileName)) {
					alert("파일 확장자 확인");
					return false;
				}
				return true;
			}
			
			// 파일선택 초기화
			var cloneObj = $('.uploadDiv').clone();
			
			
			$('#uploadBtn').on('click', function (e) {
				var formData = new FormData(); // form.enctype='multipart/form-data'와 같은 역할
				var inputFile = $('input[name="uploadFile"]');
				var files = inputFile[0].files;
				console.log(files);
				// add file data to formdata
				for(var i=0; i < files.length; i++) {
					if (!checkExtension(files[i].name, files[i].size)) {
						return false;
					}
					formData.append("uploadFile", files[i]);
				}
				for (let data of formData.entries())
					console.log(data[0], data[1]);
				
				// ajax call.
				$.ajax({
					url: 'uploadAjaxAction',
					processData: false,
					contentType: false,
					type: 'post',
					data: formData,
					success: function (result) {
						alert('Success');
						console.log(result);
						$('.uploadDiv').html(cloneObj.html()); // 선택파일 초기화
						showUploadedFile(result);						
					},
					error: function (reject) {
						alert('Error');
						console.log(reject);
					}
				})
	
			})
			
			var uploadResult = $('.uploadResult ul');
			function showUploadedFile(uploadResultArr) {
				var str = '';
				$(uploadResultArr).each(function (i, obj) {
					str += "<li>" + obj.fileName + "</li>";
				});
				uploadResult.append(str);
			}
			
		})
	</script>
	
</body>
</html>