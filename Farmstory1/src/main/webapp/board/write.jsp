<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/_header.jsp" %>
<%
	String group = request.getParameter("group");
	String cate  = request.getParameter("cate");
	pageContext.include("/board/_"+group+".jsp");
%>
<main id="board">
    <section class="write">
            <form action="#">
                <table border="0">
                    <caption>글쓰기</caption>
                    <tr>
                        <th>제목</th>
                        <td><input  type="text" 
                                    name="title" 
                                    placeholder="제목을 입력하세요.">
                        </td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td>
                            <textarea name="content"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>첨부</th>
                        <td><input type="file" name="file"></td>
                    </tr>
                    
                </table>
                <div>
                    <a href="./list.jsp?group=<%= group %>&cate=<%= cate %>" class="btn btnCancel">취소</a>
                    <input type="submit" class="btn Complete" value="작성완료"/>
                </div>
            </form>
        
    </section>

</main>
      	</article>
  </section>
</div>
<%@ include file="/_footer.jsp" %>