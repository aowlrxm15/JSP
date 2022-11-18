package vo;

public class BookVO {

	private int bookId;
	private String bookName;
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	private String publisher;
	private int price;
	
	public void setBookId(String bookId) {
		this.bookId = Integer.parseInt(bookId);
	}
	public void setPrice(String price) {
		this.price = Integer.parseInt(price);
	}
}
