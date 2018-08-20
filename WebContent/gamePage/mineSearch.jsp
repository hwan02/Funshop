<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
   int size = 10, mineNum = 10; //가로세로사이즈, 지뢰개수
   String paramSize = request.getParameter("size");
   String paramMineNum = request.getParameter("mineNum");
   if(paramSize != null) size = Integer.parseInt(paramSize);
   if(paramMineNum != null) mineNum = Integer.parseInt(paramMineNum);
   pageContext.setAttribute("size", size);
   pageContext.setAttribute("mineNum", mineNum);
   Random rd = new Random();
   boolean minePos[][] = new boolean[size][size];
   boolean flag = true;
   while(flag) {
	   for(int i=0; i<size; i++) {
		   for(int j=0; j<size; j++) {
			   if(i*10+j == rd.nextInt(size*size) && !minePos[i][j]) {
				   minePos[i][j] = true;
				   mineNum--;
				   if(mineNum == 0) {
					   flag = false;
					   break;
				   }
			   }
		   }
		   if(!flag) break;
	   }
   }
   pageContext.setAttribute("minePos", minePos);
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지뢰찾기</title>
	<script type="text/javascript" src="/Funshop/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		var size = ${size };
		var mineNum = ${mineNum };
		
		$(function() {
			$('#div_minSearch button').each(function(index) { //index : 0부터시작
				$(this).click(function (){
					var xIdx = index % size;
					var yIdx = Math.floor(index/size);
					findMine(xIdx, yIdx);
				});
				$(this).contextmenu(function() {
					if($(this).val() == '0') return false;
					if($(this).text() == '　') $(this).html('<font color=red>🚩</font>');
					else if($(this).text() == '🚩') $(this).text('?');
					else if($(this).text() == '?')  $(this).text('　');
					checkWin();
					return false;
				});
			});
		});
		
		var minesColor = ['blue','green','red','brown']; //숫자 색상
		function findMine(xIdx, yIdx) {
			if($('#bt_'+yIdx+'_'+xIdx).text() != '　') {
				return;
			}
			if($('#bt_'+yIdx+'_'+xIdx).val() == '✴') {
				gameOver();
				return;
			}
			var mines = 0; //주위 지뢰개수
			for(var i=yIdx-1; i<yIdx+2; i++) {
				for(var j=xIdx-1; j<xIdx+2; j++) {
					if(i==yIdx && j==xIdx) continue;
					if($('#bt_'+i+'_'+j).val() == '✴') mines++;
				}
			}
			if(mines > 0) {
				var minesHtml = '<font color=';
				if(mines < 5) {
					minesHtml += minesColor[mines-1];
				} else minesHtml += 'brown';
				minesHtml += '>'+mines+"</font>";
				
				
				$('#bt_'+yIdx+'_'+xIdx).html('<b>'+minesHtml+'</b>');
			} else if(mines == 0) {
				$('#bt_'+yIdx+'_'+xIdx).val('0');
				$('#bt_'+yIdx+'_'+xIdx).css({"background":"gray"});
				for(var i=yIdx-1; i<yIdx+2; i++) {
					for(var j=xIdx-1; j<xIdx+2; j++) {
						if(i< 0 || i>size-1 || j<0 || j>size-1) continue;
						if(i==yIdx && j==xIdx) continue;
						if($('#bt_'+i+'_'+j).val() == '0' || $('#bt_'+i+'_'+j).text() != '　') continue;
						findMine(j, i);
					}
				} 
			}
			checkWin();
		}
		
		function checkWin() {
			var checkedMine = 0;
			for(var i=0; i<size; i++) {
				for(var j=0; j<size; j++) {
					if($('#bt_'+i+'_'+j).text() == '🚩' && $('#bt_'+i+'_'+j).val() == '✴') checkedMine++;
					if($('#bt_'+i+'_'+j).text() == '🚩' && $('#bt_'+i+'_'+j).val() != '✴') checkedMine--;
				}
			}
			for(var i=0; i<size; i++) {
				for(var j=0; j<size; j++) {
					if(($('#bt_'+i+'_'+j).text() == '　' || $('#bt_'+i+'_'+j).text() == '?')
							&& $('#bt_'+i+'_'+j).val() != '0') return;
				}
			}
			if(mineNum == checkedMine) gameWin();
		}
		
		function gameWin() {
			$('#div_minSearch button').each(function(index) {
				$(this).off(); //버튼을 눌러도 반응하지 않게
			});
			alert('게임승리');
			if(afterMineSearchWin) {
				afterMineSearchWin();
			}
		}

		function gameOver() {
			for(var i=0; i<size; i++) {
				for(var j=0; j<size; j++) {
					if($('#bt_'+i+'_'+j).val() == '✴') {
						$('#bt_'+i+'_'+j).html('<font color=red>✴</font>');
						$('#bt_'+i+'_'+j).css({"background":"darkgray"});
					}
				}
			}
			$('#div_minSearch button').each(function(index) {
				$(this).off(); //버튼을 눌러도 반응하지 않게
			});
			alert("게임 오버");
		}
	</script>
</head>
<body>
	<h3>지뢰찾기</h3>
	<hr>
	<div id='div_minSearch'>
		<table border="solid 1px">
			<c:forEach var="i" begin="1" end="${size }">
				<tr>
				<c:forEach var="j" begin="1" end="${size }">
					<td>
						<c:if test="${minePos[i-1][j-1] }">
							<button style="width: 30px; height: 30px;" id="bt_${i-1}_${j-1}" value="✴">　</button>
						</c:if>
						<c:if test="${!minePos[i-1][j-1] }">
							<button style="width: 30px; height: 30px;" id="bt_${i-1}_${j-1}">　</button>
						</c:if>
					</td>
				</c:forEach>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>