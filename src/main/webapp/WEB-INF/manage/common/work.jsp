<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>后台管理 - 易买网</title>
    
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<c:set var="path" value="${pageContext.request.contextPath}"></c:set>   
	<link rel="stylesheet" type="text/css" href="${path}/css/style.css"/>
  </head>
  	<script type="text/javascript" src="${path}/js/jquery-1.4.1.js"></script>
  	<script type="text/javascript" >
  	$(function(){
  		$(document).ready(function(){
  		
  			var sum="";
  			for (var i = 1; i <= 9;i++) {
  				for (var j = 1; j <=9; j++) {
  					for (var x = 1; x <= 9; x++) {
  						if(i+j+x==24){
  							sum+=(i+"+"+j+"+"+x+"□");
  					
  						}
						if(i-j-x==24){
							sum+=(i+"-"+j+"-"+x+"□");
					
  						}
						if(i-j+x==24){
							sum+=(i+"-"+j+"+"+x+"□");
					
  						}
						if(i-j*x==24){
							sum+=(i+"-"+j+"*"+x+"□");
						
  						}
						if(i+j-x==24){
							sum+=(i+"+"+j+"-"+x+"□");
						
  						}
						if(i+j*x==24){
							sum+=(i+"+"+j+"*"+x+"□");
						
  						}
						if(i+j/x==24){
							sum+=(i+"+"+j+"/"+x+"□");
							
  						}
						if(i-j/x==24){
							sum+=(i+"-"+j+"/"+x+"□");
						
  						}
						if(i*j*x==24){
							sum+=(i+"*"+j+"*"+x+"□");
						
  						}if(i*j+x==24){
  							sum+=(i+"*"+j+"+"+x+"□");
  							
  						}if(i*j-x==24){
  							sum+=(i+"*"+j+"-"+x+"□");
  					
  						}if(i*j/x==24){
  							sum+=(i+"*"+j+"/"+x+"□");
  						
  						}if(i/j/x==24){
  							sum+=(i+"/"+j+"/"+x+"□");
  						}if(i/j*x==24){
  							sum+=(i+"/"+j+"*"+x+"□");
  						}if(i/j+x==24){
  							sum+=(i+"/"+j+"+"+x+"□");
  						}if(i/j-x==24){
  							sum+=(i+"/"+j+"-"+x+"□");
  						}
  						
						
  					}
  				}
			}

  			$("textarea[name]=js").text(sum);
  			
  			
			
  			
  			$("#yhks").click(function(){
  				var dkje=$("#dkje").val();
  				var dknx=$("#dknx").val();
  				var dklx=$("#dklx").val();
  				var t=$("#type").val();
  				var zlx;
  				var ybj;
  				var ylx;
  				var yhk;
  				var syje;
  				var lxje=dkje*dklx;
  				zlx=lxje-dkje;
  				var sc="";
  				if(t=="等额本金"){
  					ybj=dkje/dknx;
  					for (var i = 1; i <= dknx; i++) {
  						
  						ylx=dkje*dklx;
  						zlx+=ylx;
  						dkje=dkje-ybj;
  						var bxhj=ybj+ylx;
  						sc+=i+"."+ybj+" "+ylx+"■"+"本息合计"+bxhj;
					}
  						
  					sc+="■■■■■■■■■总利息"+zlx;
  					
  				}else{
  				var month=dknx*12;
  					dkje=dkje*(dklx+1);
  					
  					
  					
  					for (var i = 1; i < 2 ; i++) {	
  						alert(Math.pow(dkje*dklx*(dklx+1),month));
  						yhk=[Math.pow(dkje*dklx*(dklx+1),month)]/[Math.pow((1+dklx),month)-1];
  						ylx=Math.pow(dkje*dklx*(dklx+1),month);
  						alert(ylx);
  						dkje=dkje-yhk;
  						
					}
  					
  					
  					
  					
  					
  					
  				}
  				$("#hk").html(sc);
  			});
  			
  			
  			
  			
  			
  			$("#ks").click(function(){
  				
  				var gz=$("#gz").val();
  				alert(gz);
  				var wxyj=(0.08+0.02+0.005+0.07)*gz;
  				gz=gz-wxyj;
  				var zs=3500;
  				gz=gz-zs;
  				var yns=gz;
  				var sl=0;
  				var sskcs=0;
  				if (yns<=1500) {
					sl=0.03;
					sskcs=0;
				}else if(yns>1500&&yns<=4155) {
					sl=0.1;
					sskcs=105;
				}else if(yns<=7755&&yns>4155) {
					sl=0.2;
					sskcs=555;
				}else if(yns>=7755&&yns<=27255) {
					sl=0.25;
					sskcs=1005;
				}else if(yns<=41255&&yns>=27255) {
					sl=0.30;
					sskcs=2755;
				}else if(yns>=41255&&yns<=57505) {
					sl=0.35;
					sskcs=5505;
				}else if(yns>=57505) {
					sl=0.45;
					sskcs=13505;
				}
  				var yjsk=gz*sl-sskcs;
  				gz=gz-yjsk;
  				$("#wy").html(wxyj);
  				$("#ns").val(yns);
  				$("#sl").html(sl);
  				$("#kc").html(sskcs);
  				$("#sk").val(yjsk);
  				gz=gz+zs;
  				$("#sgz").val(gz);
  			});
  			
  			
  			
  			
  		});
  		});
  	</script>
 <body>
 1.
税前工资： <input id="gz" type="text" value="" /><br><br>
五险一金： <label id="wy"></label><br><br>
应纳税所得额： <input id="ns" type="text" value="" /><br><br>
适用税率：<label id="sl"></label><br><br>
速算扣除数： <label id="kc"></label><br><br>
应缴税款： <input id="sk" type="text" value="" readonly="readonly" /><br><br>
实发工资： <input id="sgz" type="text" value="" readonly="readonly" /><br><br>
  <input id="ks" type="button" value="计算	" />
 <br><br>
 <br><br>
 2. 贷款金额:<input id="dkje" type="text" value="" />
	贷款年限:<input id="dknx" type="text" value="" />
       贷款利息:<input id="dklx" type="text" value="" />
       <select id="type">
        <option value ="等额本金">等额本金</option>
 		<option value ="等额利息">等额利息</option>
 	</select>
 	<input id="yhks" type="button" value="计算" />
 	
 	<textarea rows="10" cols="220" id="hk"></textarea>
<br><br>
<br><br>
	3.
	<textarea rows="10" cols="220" name="js"></textarea>
		
	</body>
</html>
