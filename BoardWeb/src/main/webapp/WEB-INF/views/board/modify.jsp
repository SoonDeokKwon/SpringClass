<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../includes/header.jsp"></jsp:include>



            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board Modify Page
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<form action="/board/modify" method="post">
                            	<div class="form-group">
                            		<label>Bno</label>
                            		<input class="form-control" type="text" name="bno" value="${board.bno}">
                            	</div>
                            	<div class="form-group">
                            		<label>Title</label>
                            		<input class="form-control" type="text" name="title" value="${board.title }">
                            	</div>                            	
                            	<div class="form-group">
                            		<label>Writer</label>
                            		<input class="form-control" type="text" name="writer" value="${board.writer }">
                            	</div>
                            	<div class="form-group">
                            		<label>Text Area</label>
                            		<textarea class="form-control" name="content">${board.content}</textarea>
                            	</div>
                            	<button type="submit" data-oper="modify" class="btn btn-default">Submit</button>
                             	<button type="submit" data-oper="remove" class="btn btn-default">Remove</button> 
                             	<button type="submit" data-oper="list" class="btn btn-default">List</button>                           	                          	
	                            <!-- /.table-responsive -->
	                        	<input type="hidden" name="pageNum" value="${cri.pageNum }">
	                        	<input type="hidden" name="amount" value="${cri.amount }">
								<input type="hidden" name="type" value="${cri.type }">
								<input type="hidden" name="keyword" value="${cri.keyword }">                           	
                        	</form>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
			<script>
				$(document).ready(function () {
					var formObj = $('form');
					
					$('button').on('click', function (e) {
						e.preventDefault();	//기본기능 차단(suverlet 차단)
						var operation = $(this).data('oper');	//
						console.log(operation);
						
						if (operation == 'remove') {
							formObj.attr('action', '/board/remove');
						} else if(operation == 'list') {
							//self.location = '/board/list';
							//return;
							// pageNum, amount => clone() => empty() -> append(clone item)
							var pageNumTag = formObj.find('input[name="pageNum"]').clone();
							var amountTag = formObj.find('input[name="amount"]').clone();
							var typeTag = formObj.find('input[name="type"]').clone();
							var keywordTag = formObj.find('input[name="keyword"]').clone();
							formObj.attr('action', '/board/list').attr('method', 'get');
							formObj.empty();	// 파라미터 제거.
							formObj.append(pageNumTag);
							formObj.append(amountTag);
							formObj.append(typeTag);
							formObj.append(keywordTag);
							
						}
						formObj.submit();	// 기본 기능을 차단해놨기 때문에 submit 호출해야 함.
					})
					
				});
			</script>

<jsp:include page="../includes/footer.jsp"></jsp:include>