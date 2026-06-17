package jp.co.aforce.beans;

import java.io.Serializable;

public class Cart implements Serializable {
    private static final long serialVersionUID = 1L;

    private int itemId;       // 商品ID
    private String itemName;  // 商品名
    private int price;        // 価格
    private int quantity;     // 数量
    private String image;     // 画像ファイル名（もしあれば）

    // 基本的なコンストラクタ
    public Cart() {}

    // ゲッター・セッター（Eclipseの自動生成でもOK！）
    public int getItemId() { return itemId; }
    public void setItemId(int itemId) { this.itemId = itemId; }

    public String getItemName() { return itemName; }
    public void setItemName(String itemName) { this.itemName = itemName; }

    public int getPrice() { return price; }
    public void setPrice(int price) { this.price = price; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }
}