<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
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
    
        
	String sql = "select * from product where p_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	rs = pstmt.executeQuery();
    
    if (rs.next()){
        sql = "UPDATE product SET p_name=?, p_unitPrice=?, p_description=?, p_category=?, p_developer=?, p_publisher=?";
        pstmt = conn.prepareStatement(sql);
        List<String> parameters = new ArrayList<String>();
        parameters.add(name);
        parameters.add(unitPrice);
        parameters.add(description);
        parameters.add(category);
        parameters.add(developer);
        parameters.add(publisher);
        
        // 이미지 파일에 대한 처리
        if (thumbnail != null && !thumbnail.isEmpty()) {
            sql += ", p_thumbnail=?";
            parameters.add(thumbnail);
        }
        if (picture != null && !picture.isEmpty()) {
            sql += ", p_picture=?";
            parameters.add(picture);
        }
        if (logo != null && !logo.isEmpty()) {
            sql += ", p_logo=?";
            parameters.add(logo);
        }

        sql += " WHERE p_id=?";

        parameters.add(productId);
        
        pstmt = conn.prepareStatement(sql);


       for (int i = 0; i < parameters.size(); i++) {
            pstmt.setString(i + 1, parameters.get(i));
        }
        pstmt.executeUpdate();
    }
        } catch (Exception e) {
            e.printStackTrace(); // 오류 출력
            // 오류 처리 코드 추가
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
    response.sendRedirect("product_edit.jsp");
}
%>