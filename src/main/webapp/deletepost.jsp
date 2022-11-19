<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.BoardDAO"%>
<%@page import="com.example.bean.BoardVO"%>
<%@page import="com.example.common.FileUpload"%>
<%
	String sid = request.getParameter("id");
	if (sid != ""){  
		int id = Integer.parseInt(sid);
		BoardDAO boardDAO = new BoardDAO();

		String filename = BoardDAO.getPhotoFilename(id);
		if(filename != null)
			FileUpload.deleteFile(request, filename);
		boardDAO.deleteBoard(id);
	}
	response.sendRedirect("posts.jsp");
%>