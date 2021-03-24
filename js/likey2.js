$(function(){
        $("#sendButton1").click(function() {
            var params = "&meuserID=" + $("#meuserID1").val() +
            	"&userID=" + $("#userID1").val() +
            "&title=" + $("#title1").val(); //쿼리임 데이터만 넘길 것!
            $.ajax({
                type:"POST",                //전송방식
                url:"likeyAction2.jsp",    //주소
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
    		var params = "&meuserID=" + $("#meuserID1").val() +
    			"&userID=" + $("#userID2").val() +
    		"&title=" + $("#title2").val(); //쿼리임 데이터만 넘길 것!
    		$.ajax({
    			type:"POST",                //전송방식
    			url:"likeyAction2.jsp",    //주소
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
    		var params = "&meuserID=" + $("#meuserID1").val() +
    			"&userID=" + $("#userID3").val() +
    		"&title=" + $("#title3").val(); //쿼리임 데이터만 넘길 것!
    		$.ajax({
    			type:"POST",                //전송방식
    			url:"likeyAction2.jsp",    //주소
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
    		var params = "&meuserID=" + $("#meuserID1").val() +
    			"&userID=" + $("#userID4").val() +
    		"&title=" + $("#title4").val(); //쿼리임 데이터만 넘길 것!
    		$.ajax({
    			type:"POST",                //전송방식
    			url:"likeyAction2.jsp",    //주소
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