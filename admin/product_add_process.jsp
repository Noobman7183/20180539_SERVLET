<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="java.sql.*"%>
<%@ include file="../db/db_conn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	if (!isMultipart) {
		// 오류 처리: 멀티파트 데이터가 아니라면 적절한 오류 메시지 반환
	} else {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
        Map<String, String> formFields = new HashMap<String, String>();
        Map<String, FileItem> fileItems = new HashMap<String, FileItem>();

        try {
            List<FileItem> items = upload.parseRequest(request);

            for (FileItem item : items) {
                if (item.isFormField()) {
                    formFields.put(item.getFieldName(), item.getString("UTF-8"));
                } else {
                    fileItems.put(item.getFieldName(), item);
                }
            }

            // 파일 처리
            String appPath = request.getServletContext().getRealPath("");
            String saveDir = appPath + File.separator + "image"; // 이미지를 저장할 디렉토리 경로
            File fileSaveDir = new File(saveDir);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdirs(); // 디렉토리가 존재하지 않으면 새로 생성
            }

            String productId = formFields.get("productId");
            String name = formFields.get("name");
            String unitPrice = formFields.get("unitPrice");
            String description = formFields.get("description");
            String developer = formFields.get("developer");
            String publisher = formFields.get("publisher");
            String category = formFields.get("genre");
            String unitsInStock = formFields.get("unitsInStock");
            String condition = formFields.get("condition");

            String thumbnail = "";
            String picture = "";
            String logo = "";
            
            String thumbnailDir = saveDir + File.separator + "thumbnail";
            String pictureDir = saveDir + File.separator + "picture";
            String logoDir = saveDir + File.separator + "biglogo";
            String safeProductName = productId + "_" + name.replace(" ", "_");
            // 이미지 파일 처리
            FileItem productThumbnail = fileItems.get("productThumbnail");
            if (productThumbnail != null && !productThumbnail.getName().isEmpty()) {
                String originalFileName = new File(productThumbnail.getName()).getName();
                String extension = originalFileName.substring(originalFileName.lastIndexOf('.'));
                String newFileName = safeProductName + extension;
                String filePath = "image/thumbnail" + File.separator + newFileName;
                thumbnail = filePath;
                File storeFile = new File(thumbnailDir + File.separator + newFileName);
                productThumbnail.write(storeFile); // 파일 저장
            }

            FileItem productImage = fileItems.get("productImage");
            if (productImage != null && !productImage.getName().isEmpty()) {
                String originalFileName = new File(productImage.getName()).getName();
                String extension = originalFileName.substring(originalFileName.lastIndexOf('.'));
                String newFileName = safeProductName + "_1" + extension;
                String filePath = "image/picture" + File.separator + newFileName;
                logo = filePath;
                File storeFile = new File(pictureDir + File.separator + newFileName);
                productImage.write(storeFile); // 파일 저장
            }

            FileItem productLogo = fileItems.get("productLogo");
            if (productLogo != null && !productLogo.getName().isEmpty()) {
                String originalFileName = new File(productLogo.getName()).getName();
                String extension = originalFileName.substring(originalFileName.lastIndexOf('.'));
                String newFileName = safeProductName + "_Big_logo" + extension;
                String filePath = "image/biglogo" + File.separator + newFileName;
                picture = filePath;
                File storeFile = new File(logoDir + File.separator + newFileName);
                productLogo.write(storeFile); // 파일 저장
            }

			// 데이터베이스 연결 및 SQL 쿼리 실행
            String sql = "INSERT INTO product (p_id, p_name, p_unitPrice, p_description, p_category, p_developer, p_publisher, p_thumbnail, p_picture, p_logo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, productId);
            pstmt.setString(2, name);
            pstmt.setString(3, unitPrice);
            pstmt.setString(4, description);
            pstmt.setString(5, category);
            pstmt.setString(6, developer);
            pstmt.setString(7, publisher);
            pstmt.setString(8, thumbnail);
            pstmt.setString(9, picture);
            pstmt.setString(10, logo);
            pstmt.executeUpdate();

            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();

            response.sendRedirect("index_ad.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
