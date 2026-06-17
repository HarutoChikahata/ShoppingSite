package jp.co.aforce.servlet;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import jp.co.aforce.beans.Items;
import jp.co.aforce.dao.ItemsDAO;
import jp.co.aforce.tool.Action;

@MultipartConfig
public class ItemExhibitAction extends Action {
    public String execute(
        HttpServletRequest request, HttpServletResponse response
    ) throws Exception {
        
        //テキストパラメータを回収
        String itemName = request.getParameter("itemName");
        String description = request.getParameter("description");
        int price = Integer.parseInt(request.getParameter("price"));
        int stockQuantity = Integer.parseInt(request.getParameter("stockQuantity"));
        
        //画像ファイル（Part）を回収し、そこからファイル名を取得
        Part filePart = request.getPart("imageUrl");
        String imageUrl = null;
        
        if (filePart != null && filePart.getSubmittedFileName() != null && !filePart.getSubmittedFileName().isEmpty()) {
            imageUrl = filePart.getSubmittedFileName();
            
            //保存先を外部の独立したフォルダ（C:/app_images/）に指定
//            String uploadDirectory = "C:/app_images/";
            //AWSにデプロイする時はLinux用の絶対パスに書き換え
            String uploadDirectory = "/var/www/shopping_images/";
            java.io.File dir = new java.io.File(uploadDirectory);
            if (!dir.exists()) {
                dir.mkdirs(); // フォルダが存在しない場合は自動作成
            }
            
            java.io.File file = new java.io.File(uploadDirectory + imageUrl);
            
            //外部フォルダへ直接書き込み
            try (java.io.InputStream input = filePart.getInputStream();
                 java.io.FileOutputStream output = new java.io.FileOutputStream(file)) {
                
                byte[] buffer = new byte[1024];
                int length;
                while ((length = input.read(buffer)) > 0) {
                    output.write(buffer, 0, length);
                }
            }
        }
        HttpSession session = request.getSession();
        jp.co.aforce.beans.Users loginUser = (jp.co.aforce.beans.Users) session.getAttribute("users");
        
        
        // データベースへは、ファイル名だけを登録する（JSP側は変えない）
        Items item = new Items(
        		0, 
        		itemName, 
        		description,
        		price, 
        		imageUrl,
        		stockQuantity,
        		loginUser.getMemberId()
        );
        
        ItemsDAO dao = new ItemsDAO();
        int count = dao.insertItem(item);
        
        if (count > 0) {
            return "/jp/co/aforce/servlet/Home.action";
        } else {
            return "/views/item_exhibit.jsp";
        }
    }
}