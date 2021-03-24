$(function(){
        $("#sendButton1").click(function() {
            var params = "&userID=" + $("#userID1").val() +
            "&title=" + $("#title1").val(); //쿼리임 데이터만 넘길 것!
            $.ajax({
                type:"POST",                //전송방식
                url:"likeyAction.jsp",    //주소
                data:params,
                dataType : "text",
                error : function(){
                    alert('실패');
                },
                success : function(data){
                    $("#likey1").html(data) ;
                }
            });
        });
    });
 
    function showRequest(){ 
        var flag = true; //무조건 일단 true
        if(!$("#title1").val()) { //jQuery에서 가져오는 값이 없으면,
 
            alert("제목을 입력하세요!");
            $("#title1").focus();
            return false;
        }
        if(!$("#userID1").val()) { 
 
            alert("내용을 입력하세요!");
            $("#userID1").focus();
            return false;
 
        }
        // subject, content 둘 다 값이 넣어져 있으면
        return flag;
    }
    $(function(){
    	$("#sendButton2").click(function() {
    		var params = "&userID=" + $("#userID2").val() +
    		"&title=" + $("#title2").val(); //쿼리임 데이터만 넘길 것!
    		$.ajax({
    			type:"POST",                //전송방식
    			url:"likeyAction.jsp",    //주소
    			data:params,
    			dataType : "text",
    			error : function(){
    				alert('실패');
    			},
    			success : function(data){
    				$("#likey2").html(data) ;
    			}
    		});
    	});
    });
    
    function showRequest(){ 
    	var flag = true; //무조건 일단 true
    	if(!$("#title2").val()) { //jQuery에서 가져오는 값이 없으면,
    		
    		alert("제목을 입력하세요!");
    		$("#title2").focus();
    		return false;
    	}
    	if(!$("#userID2").val()) { 
    		
    		alert("내용을 입력하세요!");
    		$("#userID2").focus();
    		return false;
    		
    	}
    	// subject, content 둘 다 값이 넣어져 있으면
    	return flag;
    }
    $(function(){
    	$("#sendButton3").click(function() {
    		var params = "&userID=" + $("#userID3").val() +
    		"&title=" + $("#title3").val(); //쿼리임 데이터만 넘길 것!
    		$.ajax({
    			type:"POST",                //전송방식
    			url:"likeyAction.jsp",    //주소
    			data:params,
    			dataType : "text",
    			error : function(){
    				alert('실패');
    			},
    			success : function(data){
    				$("#likey3").html(data) ;
    			}
    		});
    	});
    });
    
    function showRequest(){ 
    	var flag = true; //무조건 일단 true
    	if(!$("#title3").val()) { //jQuery에서 가져오는 값이 없으면,
    		
    		alert("제목을 입력하세요!");
    		$("#title3").focus();
    		return false;
    	}
    	if(!$("#userID3").val()) { 
    		
    		alert("내용을 입력하세요!");
    		$("#userID3").focus();
    		return false;
    		
    	}
    	// subject, content 둘 다 값이 넣어져 있으면
    	return flag;
    }
    $(function(){
    	$("#sendButton4").click(function() {
    		var params = "&userID=" + $("#userID4").val() +
    		"&title=" + $("#title4").val(); //쿼리임 데이터만 넘길 것!
    		$.ajax({
    			type:"POST",                //전송방식
    			url:"likeyAction.jsp",    //주소
    			data:params,
    			dataType : "text",
    			error : function(){
    				alert('실패');
    			},
    			success : function(data){
    				$("#likey4").html(data) ;
    			}
    		});
    	});
    });
    
    function showRequest(){ 
    	var flag = true; //무조건 일단 true
    	if(!$("#title4").val()) { //jQuery에서 가져오는 값이 없으면,
    		
    		alert("제목을 입력하세요!");
    		$("#title4").focus();
    		return false;
    	}
    	if(!$("#userID4").val()) { 
    		
    		alert("내용을 입력하세요!");
    		$("#userID4").focus();
    		return false;
    		
    	}
    	// subject, content 둘 다 값이 넣어져 있으면
    	return flag;
    }
    $(function(){
    	$("#sendButton5").click(function() {
    		var params = "&userID=" + $("#userID5").val() +
    		"&title=" + $("#title5").val(); //쿼리임 데이터만 넘길 것!
    		$.ajax({
    			type:"POST",                //전송방식
    			url:"likeyAction.jsp",    //주소
    			data:params,
    			dataType : "text",
    			error : function(){
    				alert('실패');
    			},
    			success : function(data){
    				$("#likey5").html(data) ;
    			}
    		});
    	});
    });
    
    function showRequest(){ 
    	var flag = true; //무조건 일단 true
    	if(!$("#title5").val()) { //jQuery에서 가져오는 값이 없으면,
    		
    		alert("제목을 입력하세요!");
    		$("#title5").focus();
    		return false;
    	}
    	if(!$("#userID5").val()) { 
    		
    		alert("내용을 입력하세요!");
    		$("#userID5").focus();
    		return false;
    		
    	}
    	// subject, content 둘 다 값이 넣어져 있으면
    	return flag;
    }
    $(function(){
    	$("#sendButton6").click(function() {
    		var params = "&userID=" + $("#userID6").val() +
    		"&title=" + $("#title6").val(); //쿼리임 데이터만 넘길 것!
    		$.ajax({
    			type:"POST",                //전송방식
    			url:"likeyAction.jsp",    //주소
    			data:params,
    			dataType : "text",
    			error : function(){
    				alert('실패');
    			},
    			success : function(data){
    				$("#likey6").html(data) ;
    			}
    		});
    	});
    });
    
    function showRequest(){ 
    	var flag = true; //무조건 일단 true
    	if(!$("#title6").val()) { //jQuery에서 가져오는 값이 없으면,
    		
    		alert("제목을 입력하세요!");
    		$("#title6").focus();
    		return false;
    	}
    	if(!$("#userID6").val()) { 
    		
    		alert("내용을 입력하세요!");
    		$("#userID6").focus();
    		return false;
    		
    	}
    	// subject, content 둘 다 값이 넣어져 있으면
    	return flag;
    }
    $(function(){
    	$("#sendButton7").click(function() {
    		var params = "&userID=" + $("#userID7").val() +
    		"&title=" + $("#title7").val(); //쿼리임 데이터만 넘길 것!
    		$.ajax({
    			type:"POST",                //전송방식
    			url:"likeyAction.jsp",    //주소
    			data:params,
    			dataType : "text",
    			error : function(){
    				alert('실패');
    			},
    			success : function(data){
    				$("#likey7").html(data) ;
    			}
    		});
    	});
    });
    
    function showRequest(){ 
    	var flag = true; //무조건 일단 true
    	if(!$("#title7").val()) { //jQuery에서 가져오는 값이 없으면,
    		
    		alert("제목을 입력하세요!");
    		$("#title7").focus();
    		return false;
    	}
    	if(!$("#userID7").val()) { 
    		
    		alert("내용을 입력하세요!");
    		$("#userID7").focus();
    		return false;
    		
    	}
    	// subject, content 둘 다 값이 넣어져 있으면
    	return flag;
    }
    $(function(){
    	$("#sendButton8").click(function() {
    		var params = "&userID=" + $("#userID8").val() +
    		"&title=" + $("#title8").val(); //쿼리임 데이터만 넘길 것!
    		$.ajax({
    			type:"POST",                //전송방식
    			url:"likeyAction.jsp",    //주소
    			data:params,
    			dataType : "text",
    			error : function(){
    				alert('실패');
    			},
    			success : function(data){
    				$("#likey8").html(data) ;
    			}
    		});
    	});
    });
    
    function showRequest(){ 
    	var flag = true; //무조건 일단 true
    	if(!$("#title8").val()) { //jQuery에서 가져오는 값이 없으면,
    		
    		alert("제목을 입력하세요!");
    		$("#title8").focus();
    		return false;
    	}
    	if(!$("#userID8").val()) { 
    		
    		alert("내용을 입력하세요!");
    		$("#userID8").focus();
    		return false;
    		
    	}
    	// subject, content 둘 다 값이 넣어져 있으면
    	return flag;
    }
    $(function(){
    	$("#sendButton9").click(function() {
    		var params = "&userID=" + $("#userID9").val() +
    		"&title=" + $("#title9").val(); //쿼리임 데이터만 넘길 것!
    		$.ajax({
    			type:"POST",                //전송방식
    			url:"likeyAction.jsp",    //주소
    			data:params,
    			dataType : "text",
    			error : function(){
    				alert('실패');
    			},
    			success : function(data){
    				$("#likey9").html(data) ;
    			}
    		});
    	});
    });
    
    function showRequest(){ 
    	var flag = true; //무조건 일단 true
    	if(!$("#title9").val()) { //jQuery에서 가져오는 값이 없으면,
    		
    		alert("제목을 입력하세요!");
    		$("#title9").focus();
    		return false;
    	}
    	if(!$("#userID9").val()) { 
    		
    		alert("내용을 입력하세요!");
    		$("#userID9").focus();
    		return false;
    		
    	}
    	// subject, content 둘 다 값이 넣어져 있으면
    	return flag;
    }