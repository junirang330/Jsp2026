<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import = "java.util.*" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<div class="joinwrap">
		<h2 text-align="center" >MyPage</h2>
		<form action="MyPageUpdate.do" method = "post" name="mfrm">
			<table width="500" border="1">
				<tr height = "50">
					<td align = "center" width = "150">아이디</td>
					<td width = "350">
						<input type = "text" name = "id" placeholder = "아이디를 입력하세요" value = "${mdto.id }" readonly/>
					</td>
				</tr>
				<tr height = "50">
					<td align = "center" width = "150">비밀번호</td>
					<td width = "350">
						<input type = "password" name = "pass" placeholder = "영문과 숫자만 입력하세요" value="${mdto.pass }"/>
					</td>
				
				</tr>
				<tr height = "50">
					<td align = "center" width = "150">비밀번호 확인</td>
					<td width = "350">
						<input type = "password" name = "passchk" placeholder = "영문과 숫자만 입력하세요" value="${mdto.pass }"/>
					</td>
				</tr>
				<tr height = "50">
					<td align = "center" width = "150">Email</td>
					<td width = "350">
						<input type = "email" name = "email" placeholder = "@를 포함하여 입력하세요" value="${mdto.email }"/>
					</td>
				</tr>
				<tr height = "50">
					<td align = "center" width = "150">전화번호</td>
					<td width = "350">
						<input type = "tel" name = "tel" placeholder = "010-0000-0000 형식으로 입력" value="${mdto.tel }"/>
					</td>
				</tr>
				<tr height = "50">
					<td align = "center" width = "150">관심분야</td>
					<td width = "350">
						<input type = "checkbox" name = "hobby" value = "캠핑" id ="camping"/>
						<label for="camping">캠핑</label> &nbsp;&nbsp;
						<input type = "checkbox" name = "hobby" value = "등산" id ="mount"/>
						<label for="mount">등산</label> &nbsp;&nbsp;
						<input type = "checkbox" name = "hobby" value = "영화" id ="movie"/>
						<label for="movie">영화</label> &nbsp;&nbsp;
						<input type = "checkbox" name = "hobby" value = "독서" id ="book"/>
						<label for="book">독서</label> &nbsp;&nbsp;
					</td>
				</tr>
				<tr height="50">
					<td width="150" align = "center">직업</td>
					<td width="350" align = "center" >
						<select name = "job">
							<option value="교사" ${mdto.job == "교사"?'selected':'' }>교사</option>
							<option value="변호사" ${mdto.job == "변호사"?'selected':'' }>변호사</option>
							<option value="의사" ${mdto.job == "의사"?'selected':'' }>의사</option>
							<option value="기술사" ${mdto.job == "기술사"?'selected':'' }>기술사</option>
						</select>
					</td>
				</tr>
				
				<tr height = "50">
					<td align = "center" width = "150" >연령</td>
					<td width = "350" >
						<input type = "radio" name = "age" value = "10대" ${mdto.age=="10대"?'selected':'' } id ="teenage"/>
						<label for="teenage">10대</label> &nbsp;&nbsp;
						<input type = "radio" name = "age" value = "20대" ${mdto.age=="20대"?'selected':'' } id ="twenty"/>
						<label for="twenty">20대</label> &nbsp;&nbsp;
						<input type = "radio" name = "age" value = "30대" ${mdto.age=="30대"?'selected':'' } id ="thirty"/>
						<label for="thirty">30대</label> &nbsp;&nbsp;
						<input type = "radio" name = "age" value = "40대" ${mdto.age=="40대"?'selected':'' } id ="forty"/>
						<label for="forty">40대</label> &nbsp;&nbsp;
					</td>
				</tr>
				<tr height = "50">
					<td align = "center" width = "150" >남기는 말</td>
					<td width = "350">
						<textarea rows="5" cols="40" name = "info" >${mdto.info }</textarea>
					</td>
				</tr>
				<tr height = "50">
					<td colspan = "2" align = "center">
						<input type = "button" value = "수정" onclick="chkform()"/>
						<input type = "reset" value = "취소"/>
					</td>
				</tr>
			</table>			
		</form>
	
	</div>
	<script type="text/javascript">
		function chkform(){
			let f = document.mfrm;
			
			if(f.id.value == ""){
				alert("아이디를 입력하세요");
				f.id.focus();
				return;
			}
			if(f.pass.value == ""){
				alert("비밀번호를 입력하세요");
				f.pass.focus();
				return;
			}
			if(f.passchk.value== ""){
				alert("비밀번호를 다시 입력하세요");
				f.passchk.focus();
				return;
			}
			if(f.email.value==""){
				alert("이메일을 입력하세요");
				f.email.focus();
				return;
			}
			if(f.tel.value==""){
				alert("전화번호를 입력하세요");
				f.tel.focus();
				return;
			}
			// -----------------------------------------------------
			// hobby 예외처리는 반복문을 돌려야, 예외처리가 가능하다
			let hobCheck = false;
			for(let i = 0; i<f.hobby.length; i++){
				if(f.hobby[i].checked){
					hobCheck = true;
					break;
				}
			}
			if(!hobCheck){
				alert("관심분야를 선택하세요");
				f.hobby[0].focus()='checked';
				return;
			}
			// -----------------------------------------------------
			if(f.job.value==""){
				alert("직업을 입력하세요");
				f.job.focus();
				return;
			}
			if(f.age.value==""){
				alert("연령을 입력하세요");
				f.age.focus();
				return;
			}
			if(f.info.value==""){
				alert("남기는 말을 입력하세요");
				f.info.focus();
				return;
			}
			f.submit();
		}
	</script>	




    