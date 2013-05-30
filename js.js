function MouseInBuild(t){
	for(var i=1;i<=6;i++){
		if(i == t){
			document.getElementById("b" + i).className = "li1";
			document.getElementById("ClassContent" + i).style.display = "block";
		}
		else{
			document.getElementById("b" + i).className = "li2";
			document.getElementById("ClassContent" + i).style.display = "none";
		}
	}
}
function change(a){
	a.style.display = "block";
	a.style.position = "relative";
	a.style.left = "20px";
	a.style.width = "350px";
	a.style.background = "#fff";
}
function change2(b){
	//b.className = "classroominfo2";
	b.style.display = "inline";
	b.style.width = "1px";
	b.style.left = "0";
	b.style.background = "none";
}