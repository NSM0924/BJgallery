window.onload = pageLoad;
function pageLoad(){
    var text = document.getElementById("idtext");
    document.getElementById("userid").value = text.value;
};

function layerToggle(){
    $('.layer').toggle()
}
function imgToggle1(){
    $('#viewer1').toggle()
}
function imgToggle2(){
	$('#viewer2').toggle()
}
function imgToggle3(){
	$('#viewer3').toggle()
}
function imgToggle4(){
	$('#viewer4').toggle()
}
function imgToggle5(){
	$('#viewer5').toggle()
}
function imgToggle6(){
	$('#viewer6').toggle()
}
function imgToggle7(){
	$('#viewer7').toggle()
}
function imgToggle8(){
	$('#viewer8').toggle()
}
function imgToggle9(){
	$('#viewer9').toggle()
}

$(document).on('click', '.plusIcon img, .layer__close', layerToggle)
$(document).on('click', '.img1, .close1', imgToggle1)
$(document).on('click', '.img2, .close2', imgToggle2)
$(document).on('click', '.img3, .close3', imgToggle3)
$(document).on('click', '.img4, .close4', imgToggle4)
$(document).on('click', '.img5, .close5', imgToggle5)
$(document).on('click', '.img6, .close6', imgToggle6)
$(document).on('click', '.img7, .close7', imgToggle7)
$(document).on('click', '.img8, .close8', imgToggle8)
$(document).on('click', '.img9, .close9', imgToggle9)

function hideParent(){
    document.getElementById("sec1").style.display ='none';
    document.getElementById("sec2").style.display ='inline';
}
function hideParent2(){
    document.getElementById("sec2").style.display ='none';
    document.getElementById("sec3").style.display ='inline';
}
function hideParent3(){
    document.getElementById("sec3").style.display ='none';
    document.getElementById("sec4").style.display ='inline';
}

function showParent(){
    document.getElementById("sec1").style.display ='inline';
    document.getElementById("sec2").style.display ='none';
}
function showParent2(){
    document.getElementById("sec2").style.display ='inline';
    document.getElementById("sec3").style.display ='none';
}
function showParent3(){
    document.getElementById("sec3").style.display ='inline';
    document.getElementById("sec4").style.display ='none';
}