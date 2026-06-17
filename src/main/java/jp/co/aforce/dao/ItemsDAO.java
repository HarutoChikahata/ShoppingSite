package jp.co.aforce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jp.co.aforce.beans.Items;

public class ItemsDAO extends DAO {
	
	//Home:管理している商品の一覧表示のために全件を持ってくるのメソッド
	public List<Items> getAllItems() throws Exception{
		List<Items> list = new ArrayList<>();
		
		//1．接続メソッドでDBに接続
		Connection con = getConnection();
		
		//2．created_at DESC　で新着順に並べる
		PreparedStatement st = con.prepareStatement(
			"SELECT * FROM items ORDER BY created_at DESC"
		);
		//3．executeQueryメソッドで実行
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			Items item =new Items(
			    rs.getInt("item_id"),
			    rs.getString("item_name"),
			    rs.getString("description"),
			    rs.getInt("price"),
			    rs.getString("image_url"),
			    rs.getInt("stock_quantity"),
			    rs.getString("member_id")
			);
			list.add(item);
					
		}
		
		rs.close();
		st.close();
		con.close();
		
		return list;
	}
	
	//ItemExhibit:新しく野球道具を出品登録するためのメソッド
	public int insertItem(Items item) throws Exception{
		Connection con = getConnection();	
		
		//item_id は自動連番（AUTO_INCREMENT）なので、それ以外の5項目をインサート
		PreparedStatement st = con.prepareStatement(
			"INSERT INTO items (item_name, description, price, image_url, stock_quantity, member_id) VALUES(?,?,?,?,?,?)"
		);
		
		//Beans（item）から値を取り出して、プレースホルダー(?)にセット
		st.setString(1, item.getItemName());
		st.setString(2, item.getDescription());
		st.setInt(3, item.getPrice());
		st.setString(4, item.getImageUrl());
		st.setInt(5, item.getStockQuantity());
		st.setString(6, item.getMemberId());
		
		//SQL実行、登録された行数を回収
		int line = st.executeUpdate();
		
		st.close();
		con.close();
		
		return line;
	}
	
	//ItemDetail:商品ID(itemId)をキーにして、特定の1件の道具だけを表示するメソッド
    public Items getItemDetail(int itemId) throws Exception {
        Items item = null;
        Connection con = getConnection();

        // 商品IDが一致するデータだけを狙い撃ち
        PreparedStatement st = con.prepareStatement(
            "SELECT * FROM items WHERE item_id = ?"
        );
        st.setInt(1, itemId);
        ResultSet rs = st.executeQuery();


        if (rs.next()) {
            item = new Items(
                rs.getInt("item_id"),
                rs.getString("item_name"),
                rs.getString("description"),
                rs.getInt("price"),
                rs.getString("image_url"),
                rs.getInt("stock_quantity"),
                rs.getString("member_id")
            );
        }

        rs.close();
        st.close();
        con.close();

        return item; // 見つかった1件の箱（無ければnull）を返す
    }
    
    //ItemSearch:キーワードを受け取って、商品名にその文字が含まれる商品をリストで返す
 	public List<Items> searchItems(String keyword) throws Exception {
 		List<Items> list = new ArrayList<>();
 		Connection con = getConnection();
 		
 		//LIKE と % を使って部分一致（あいまい検索）
 		PreparedStatement st = con.prepareStatement(
 				"SELECT * FROM items WHERE item_name LIKE ? ORDER BY created_at DESC"
 		);
 		
 		st.setString(1, "%" + keyword + "%");
 		ResultSet rs = st.executeQuery();
 		
 		while(rs.next()) {
 				Items item = new Items(
 						rs.getInt("item_id"),
 						rs.getString("item_name"),
 						rs.getString("description"),
 						rs.getInt("price"),
 						rs.getString("image_url"),
 						rs.getInt("stock_quantity"),
 						rs.getString("member_id")
 				);
 				list.add(item);
 		}
 	
 	
 		rs.close();
 		st.close();
 		con.close();
 		
 		return list;
 	}
}
