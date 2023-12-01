<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

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
			Product newProduct = new Product();

            // 파일 처리
            String appPath = request.getServletContext().getRealPath("");
            String productName = formFields.get("name"); // 상품명을 폼 필드에서 가져옴
            String safeProductName = productName.replace(" ", "_"); // 공백을 언더스코어로 변경

            FileItem productThumbnail = fileItems.get("productThumbnail");
            if (productThumbnail != null && !productThumbnail.getName().isEmpty()) {
                
                String originalFileName = productThumbnail.getName();
                String extension = originalFileName.substring(originalFileName.lastIndexOf('.'));
                String newFileName = safeProductName + extension;
                
                String filePath = "image/thumbnail" + File.separator + newFileName;
                newProduct.setThumbnail(filePath);
                File storeFile = new File(filePath);
                productThumbnail.write(storeFile);
            }

            FileItem productImage = fileItems.get("productImage");
            if (productImage != null && !productImage.getName().isEmpty()) {
                String originalFileName = productThumbnail.getName();
                String extension = originalFileName.substring(originalFileName.lastIndexOf('.'));
                String newFileName = safeProductName + "_Picture_1" + extension;
                String filePath = "image/picture" + File.separator + newFileName;
                newProduct.setPicture(filePath);
                File storeFile = new File(filePath);
                productImage.write(storeFile);
            }

            FileItem productLogo = fileItems.get("productLogo");
            if (productLogo != null && !productLogo.getName().isEmpty()) {
                String originalFileName = productThumbnail.getName();
                String extension = originalFileName.substring(originalFileName.lastIndexOf('.'));
                String newFileName = safeProductName + "_Big_logo"+ extension;
                String filePath = "image/biglogo" + File.separator + newFileName;
                newProduct.setBiglogo(filePath);
                File storeFile = new File(filePath);
                productLogo.write(storeFile);
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

			// 나머지 로직 처리...
			Integer price = unitPrice.isEmpty() ? 0 : Integer.valueOf(unitPrice);
			long stock = unitsInStock == null || unitsInStock.isEmpty() ? 0 : Long.valueOf(unitsInStock);

			ProductRepository dao = ProductRepository.getInstance();

			newProduct.setProductId(productId);
			newProduct.setPname(name);
			newProduct.setUnitPrice(price);
			newProduct.setDescription(description);
			newProduct.setDeveloper(developer);
			newProduct.setPublisher(publisher);
			newProduct.setCategory(category);
			newProduct.setUnitsInStock(stock);
			newProduct.setCondition(condition);
            
			dao.addProduct(newProduct);

		} catch (FileUploadException e) {
			// 파일 업로드 예외 처리
		}
	}

	response.sendRedirect("index_ad.jsp");
%>