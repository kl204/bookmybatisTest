package bitedu.bipa.book.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bitedu.bipa.book.dao.BookDao;
import bitedu.bipa.book.vo.BookCopy;
import bitedu.bipa.book.vo.UserCopy;

@Service("BookService")
public class BookService {
	
	@Autowired
	private BookDao dao;
	
	public int checkId(String id) {
		int flag = 0;
		
		UserCopy idchk = dao.checkIdDao(id); 
		
		System.out.println("idchk : "+idchk);
		
		if(idchk!=null) {
		String idCheck = idchk.getUserId();		 
		
		System.out.println(id);
		if(id.equals(idCheck)) {
			flag = 1;
		}
		
		}
		return flag;
	}	
	
	public boolean registUser(UserCopy copy) {
		boolean flag = false;
		
		flag = dao.insertUser(copy);
		
		System.out.println(flag);
		return flag;
	}	

	public boolean registBook(BookCopy copy) {
		boolean flag = false;
		flag = dao.insertBook(copy);
		return flag;
	}
	
	public ArrayList<BookCopy> selectBookAll(){
		ArrayList<BookCopy> list = null;
		list = dao.selectBookAll();
		return list;
	}
	public boolean removeBook(String bookSeq) {
		// TODO Auto-generated method stub
		boolean flag = false;
		flag = dao.deleteBook(Integer.parseInt(bookSeq));
		return flag;
	}
	public BookCopy findBook(String bookSeq) {
		BookCopy copy = null;
		copy = dao.selectBook(Integer.parseInt(bookSeq));
		System.out.println(copy);
		return copy;
	}
	public boolean modifyBook(BookCopy copy) {
		// TODO Auto-generated method stub
		boolean flag = false;
		flag = dao.updateBook(copy);
		return flag;
	}
}







