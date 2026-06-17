package jp.co.aforce.servlet;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.Cart;
import jp.co.aforce.beans.Users;
import jp.co.aforce.tool.Action;

public class OrderConfirmAction extends Action {
    @Override
    public String execute(
        HttpServletRequest request, HttpServletResponse response
    ) throws Exception {
        
        HttpSession session = request.getSession();
        
        //ログインチェック
        Users loginUser = (Users) session.getAttribute("users");
        if (loginUser == null) {
            return "/views/log_in.jsp"; // ログインしてなければログイン画面へ
        }
        
        // カートの中身をセッションから取得
        @SuppressWarnings("unchecked")
        List<Cart> cartList = (List<Cart>) session.getAttribute("cart");
        
        //カートが空っぽならカート画面に戻す
        if (cartList == null || cartList.isEmpty()) {
            request.setAttribute("error", "カートに商品が入っていません。");
            return "/views/cart.jsp";
        }
        
        //合計金額の計算
        int totalAmount = 0;
        for (Cart cart : cartList) {
            totalAmount += cart.getPrice() * cart.getQuantity();
        }
        
        //合計金額をリクエストスコープにセットしてJSPに渡す
        request.setAttribute("totalAmount", totalAmount);
        
        //注文確認画面へ進む
        return "/views/order_confirm.jsp";
    }
}