package bitedu.bipa.book.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bitedu.bipa.book.vo.BookCopy;
import bitedu.bipa.book.vo.UserCopy;

@Repository("BookDao")
public class BookDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public UserCopy checkIdDao(String Id) {
		UserCopy copy = null;
	
		System.out.println(Id);
		copy = sqlSession.selectOne("mapper.book.checkUser", Id);
		
		return copy;
	}	
	
	
	public boolean insertUser(UserCopy copy){
		boolean flag = false;
	
		int insertFlag = sqlSession.insert("mapper.book.insertUser", copy);
		
		System.out.println(insertFlag);
		
		if(insertFlag>0) {
			flag = true;
		}
		
		return flag;
	}
	
	public boolean insertBook(BookCopy copy){
		boolean flag = false;
	
		int insertFlag = sqlSession.insert("mapper.book.insertBook", copy);
		
		if(insertFlag>0) {
			flag = true;
		}
		
		return flag;
	}
	
	public ArrayList<BookCopy> selectBookAll(){
		ArrayList<BookCopy> list = null;
		
		list = (ArrayList)sqlSession.selectList("mapper.book.selectAllBook");
		System.out.println(list.size());
		
		return list;
	}
	public boolean deleteBook(int parseInt) {
		boolean flag = false;
		
		int deleteFlag = sqlSession.delete("mapper.book.deleteBook", parseInt);
		
		if(deleteFlag > 0) {
			flag = true;
		}
	
		return flag;
	}
	public BookCopy selectBook(int parseInt) {
		BookCopy copy = null;
	
		copy = sqlSession.selectOne("mapper.book.selectBookBySeq", parseInt);
		
		return copy;
	}
	public boolean updateBook(BookCopy copy) {
		boolean flag = false;
	
		int updateFlag = sqlSession.update("mapper.book.updateBook", copy);
		
		if(updateFlag > 0) {
			flag = true;
		}
		
		return flag;
	}
}







