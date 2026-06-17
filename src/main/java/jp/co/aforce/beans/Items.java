package jp.co.aforce.beans;

import java.io.Serializable;

public class Items implements Serializable {
    private static final long serialVersionUID = 1L;

    //カラムに合わせたカプセル化
    private int itemId;
    private String itemName;
    private String description;
    private int price;
    private String imageUrl;
    private int stockQuantity;
    private String memberId;
    
    // コンストラクタ（引数なし）
    public Items() {}

    // コンストラクタ（全フィールド初期化用）
    public Items(int itemId, String itemName, String description, int price, String imageUrl, int stockQuantity, String memberId) {
        this.itemId = itemId;
        this.itemName = itemName;
        this.description = description; 
        this.price = price;
        this.imageUrl = imageUrl;
        this.stockQuantity = stockQuantity;
        this.memberId = memberId;
    }
    
    //右クリック➔ソース➔getterおよびsetterの生成
	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public int getStockQuantity() {
		return stockQuantity;
	}

	public void setStockQuantity(int stockQuantity) {
		this.stockQuantity = stockQuantity;
	}
    
	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
    
}


   

