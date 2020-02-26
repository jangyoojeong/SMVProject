package movieDAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.NamingException;

import com.movie.haeva.LoginFailException;
import com.sun.xml.internal.bind.v2.runtime.output.StAXExStreamWriterOutput;

import movieDBConn.MovieDBConn;
import movieVO.MovieVO;

public class MovieDAO {

	private static Connection con;
	static PreparedStatement  pstmt = null;
	static ResultSet		   rs	 = null;

	public MovieDAO() throws ClassNotFoundException, SQLException {
		con = new MovieDBConn().getConnection();
	}
	
	
	
	//close  PreparedStatement
	public void pstmtClose() throws SQLException {
		if(pstmt!=null) {
			pstmt.close();
		}
	}

	public void allClose() throws SQLException {
		if(rs	!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(con	!=null) {con.close();}
	}
	
	public static MovieVO getInfo(String id) throws SQLException  {
		
		MovieVO mv = null;
		
		String sql = "select * from moviemember where id = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
			int join_no = rs.getInt("join_no");
			String id1 = rs.getString("id");
			String password =  rs.getString("password");
			String name =  rs.getString("name");
			Date birthd = rs.getDate("birthd");
			String email = rs.getString("email");
			String tel = rs.getString("tel");
			mv = new MovieVO(join_no, id1, password, name, birthd, email, tel);
		} else {
			mv = null;
		}
		
		return mv;
	}
	
	private Date toDate(Timestamp date) {
		return date == null ? null : new Date(date.getTime());
	}
	
	//회원가입
	public void join(String id, String password, String name, String birthd, String email, String tel) {
		String sql = "insert into moviemember values(m_seq.nextval,?,?,?,?,?,?)";
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, password);
				pstmt.setString(3, name);
					int year  = Integer.parseInt(birthd.substring(0,4))-1900;
					int month = Integer.parseInt(birthd.substring(5,7))-1;
					int day   = Integer.parseInt(birthd.substring(8,10));
					Date birthd1 = new Date(year,month,day);
				pstmt.setDate(4, birthd1);
				pstmt.setString(5, email);
					String tel1 = tel.substring(0,3)+"-"+tel.substring(3,7)+"-"+tel.substring(7,11);
					//System.out.println(tel1);
				pstmt.setString(6, tel1);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	//회원정보 수정
	public void memUpdate(String id, String password, String name, String birthd, String email, String tel) {
		String sql = "update moviemember set password=?, name=?, birthd=?, email=?, tel=? where id=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, password);
			pstmt.setString(2, name);
				int year  = Integer.parseInt(birthd.substring(0,4))-1900;
				int month = Integer.parseInt(birthd.substring(5,7))-1;
				int day   = Integer.parseInt(birthd.substring(8,10));
				Date birthd1 = new Date(year,month,day);
			pstmt.setDate(3, birthd1);
			pstmt.setString(4, email);
				String tel1 = tel.substring(0,3)+"-"+tel.substring(3,7)+"-"+tel.substring(7,11);
				//System.out.println(tel1);
			pstmt.setString(5, tel1);
			pstmt.setString(6, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//id 중복체크
	public int checkOverId(String id1) throws SQLException {
		String sql = "select count(*) as cnt from moviemember where id = ?";
		int check;
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id1);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			check = rs.getInt("cnt");
			return check;
		} else {
			check = rs.getInt("cnt");
			return check;
		}
	}
	
	//총 게시글 수 구하는 메소드
	public int r_count(String mov_name1) throws SQLException {
		String sql = "select count(*) as total from review where mov_name = ?";
		int total = 0;
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, mov_name1);
		
		rs = pstmt.executeQuery();
			
		if(rs.next()) {
			/*return rs.getInt(1);*/
			total = rs.getInt("total");
			return total;
		}
			
		

		return total;
	}
	
	//페이징 처리 서칭
			public ArrayList<MovieVO> paging(String mov_name1, int startRow, int cntRow) throws SQLException {
				
				ArrayList<MovieVO> moarray = new ArrayList<MovieVO>();
				String sql = "select x.rnum, x.r_num, x.id, x.r_name, x.r_title, x.r_date, x.mov_name, x.r_replay, x.r_hit, x.r_star from (select rownum as rnum, A.r_num, A.id, A.r_name, A.r_title, A.r_date, A.mov_name, A.r_replay, A.r_hit, A.r_star from (select r_num, id, r_name, r_title, r_date, mov_name, r_replay, r_hit, r_star from review where mov_name=? order by r_num desc) A where rownum <= ?) x where x.rnum >= ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mov_name1);
				pstmt.setInt(2, cntRow);
				pstmt.setInt(3,  startRow);
				rs = pstmt.executeQuery();
				
				/*while(rs.next()) {
					moarray.add(serchReview1(rs));
				}*/

			
				while(rs.next()) {
					int r_num = rs.getInt("r_num");
					String id = rs.getString("id");
					String r_name = rs.getString("r_name");
					String r_title = rs.getString("r_title");
					Timestamp r_date = rs.getTimestamp("r_date");
					String mov_name = rs.getString("mov_name");
					String r_replay = rs.getString("r_replay");
					int r_hit = rs.getInt("r_hit");
					int r_star = rs.getInt("r_star");
					MovieVO mv = new MovieVO(r_num, id, r_name, r_title, r_date, mov_name, r_replay, r_hit, r_star);
					moarray.add(mv);
					/*System.out.println(0);*/
				}
				return moarray;
			}
	
			//제목 검색시 서칭 (+페이징처리)
		    public ArrayList<MovieVO> title_searchpaging(String r_search, String mov_name1, int startRow, int cntRow) throws SQLException {
		        
		        ArrayList<MovieVO> moarray = new ArrayList<MovieVO>();
		        String sql = "select x.rnum, x.r_num, x.id, x.r_name, x.r_title, x.r_date, x.mov_name, x.r_replay, x.r_hit, x.r_star from (select rownum as rnum, A.r_num, A.id, A.r_name, A.r_title, A.r_date, A.mov_name, A.r_replay, A.r_hit, A.r_star from (select r_num, id, r_name, r_title, r_date, mov_name, r_replay, r_hit, r_star from review where r_title like ? and mov_name = ? order by r_num desc) A where rownum <= ?) x where x.rnum >= ?";
		        /*String sql = "select * from review where r_title like ? and mov_name = ? order by r_hit desc";*/
		        
		        pstmt = con.prepareStatement(sql);
		        pstmt.setString(1, "%"+r_search+"%");
		        pstmt.setString(2, mov_name1);
		        pstmt.setInt(3, cntRow);
		        pstmt.setInt(4,  startRow);
		        rs = pstmt.executeQuery();
		        
		        /*while(rs.next()) {
		           moarray.add(serchReview1(rs));
		        }*/

		     
		        while(rs.next()) {
		           int r_num = rs.getInt("r_num");
		           String id = rs.getString("id");
		           String r_name = rs.getString("r_name");
		           String r_title = rs.getString("r_title");
		           Timestamp r_date = rs.getTimestamp("r_date");
		           String mov_name = rs.getString("mov_name");
		           String r_replay = rs.getString("r_replay");
		           int r_hit = rs.getInt("r_hit");
		           int r_star = rs.getInt("r_star");
		           MovieVO mv = new MovieVO(r_num, id, r_name, r_title, r_date, mov_name, r_replay, r_hit, r_star);
		           moarray.add(mv);
		           /*System.out.println(0);*/
		        }
		        return moarray;
		     }
			
		    //리뷰 제목 검색시 총 게시글 수 구하는 메소드
			public int search_r_count(String r_search, String mov_name1) throws SQLException {
				String sql = "select count(*) as total from review where r_title like ? and mov_name = ?";
				int total = 0;
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+r_search+"%");
				pstmt.setString(2, mov_name1);
				/*System.out.println("臾대툕�꽕�엫"+mov_name);*/
				
				rs = pstmt.executeQuery();
					
				if(rs.next()) {
					/*return rs.getInt(1);*/
					total = rs.getInt("total");
					return total;
				}
					
				

				return total;
			}
			
			//영화별 리뷰 내용 추출
			public ArrayList<MovieVO> serchReview(String mov_name1) throws SQLException {
				
				ArrayList<MovieVO> moarray = new ArrayList<MovieVO>();
				String sql = "select * from review where mov_name=? order by r_num desc";	
				//String sql = "select * from review where mov_name=?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mov_name1);
				/*System.out.println(mov_name1);*/
				rs = pstmt.executeQuery();
				while(rs.next()) {
					int r_num = rs.getInt("r_num");
					String id = rs.getString("id");
					String r_name = rs.getString("r_name");
					String r_title = rs.getString("r_title");
					Timestamp r_date = rs.getTimestamp("r_date");
					String mov_name = rs.getString("mov_name");
					String r_replay = rs.getString("r_replay");
					int r_hit = rs.getInt("r_hit");
					int r_star = rs.getInt("r_star");
					MovieVO mv = new MovieVO(r_num, id, r_name, r_title, r_date, mov_name, r_replay, r_hit, r_star);
					moarray.add(mv);
					/*System.out.println(0);*/
				}
				return moarray;
			}
			
	public MovieVO mov_getInfo(String movieName) throws SQLException {
					
					MovieVO mvinfo = null;
					String sql = "select * from movie where mov_name like ?"; 
					
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, movieName+"%");
					rs = pstmt.executeQuery();
					if(rs.next()) { 
						String mov_name = rs.getString("mov_name");
						String sub_name = rs.getString("sub_name");
						String p_image = rs.getString("p_image");
						String p_trailer = rs.getString("p_trailer");
						String p_content = rs.getString("p_content");
						String p_dir = rs.getString("p_dir");
						String p_app = rs.getString("p_app");
						String p_grade = rs.getString("p_grade");
						String p_summary = rs.getString("p_summary");
						String p_photo1 = rs.getString("p_photo1");
						String p_photo2 = rs.getString("p_photo2");
						String p_photo3 = rs.getString("p_photo3");
						mvinfo = new MovieVO(mov_name, sub_name, p_image, p_trailer, p_content, p_dir, p_app, p_grade, p_summary, p_photo1, p_photo2, p_photo3);
						
						} else { 
							mvinfo = null; 
						}
						
						return mvinfo;
	}
	
	//영화 전체 추출
	public ArrayList<MovieVO> Movie_All() throws SQLException {
		
		ArrayList<MovieVO> moarray = new ArrayList<MovieVO>();
		String sql = "select * from movie order by p_image";	
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			String mov_name = rs.getString("mov_name");
			String sub_name = rs.getString("sub_name");
			String p_image = rs.getString("p_image");
			String p_trailer = rs.getString("p_trailer");
			String p_content = rs.getString("p_content");
			String p_dir = rs.getString("p_dir");
			String p_app = rs.getString("p_app");
			String p_grade = rs.getString("p_grade");
			String p_summary = rs.getString("p_summary");
			String p_photo1 = rs.getString("p_photo1");
			String p_photo2 = rs.getString("p_photo2");
			String p_photo3 = rs.getString("p_photo3");
			MovieVO mv = new MovieVO(mov_name, sub_name, p_image, p_trailer, p_content, p_dir, p_app, p_grade, p_summary, p_photo1, p_photo2, p_photo3);
			moarray.add(mv);
			/*System.out.println(0);*/
		}
		return moarray;
	}
	
	//로그인
	public MovieVO login(String id1, String pw1) throws SQLException {
		MovieVO mvo = null;
		String sql = "select * from moviemember where id = ? and password = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id1);
		pstmt.setString(2, pw1);
		rs = pstmt.executeQuery();
		System.out.println("응?");
		if(rs.next()) { 
			int join_no = rs.getInt("join_no");
			String id = rs.getString("id");
			String password = rs.getString("password");
			String name = rs.getString("name");
			Date birthd = rs.getDate("birthd");
			String email = rs.getString("email");
			String tel = rs.getString("tel");
			
			mvo = new MovieVO(join_no, id, password, name, birthd, email, tel);
			return mvo;
			
		} else { 
			//throw new LoginFailException();
			return mvo;
		}
			
			
	}
	
	//리뷰하나 선택시 추출
	public MovieVO serchOneReview(int r_num1) throws SQLException {
		MovieVO mv = null;
		String sql = "select * from review where r_num=?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, r_num1);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			int r_num = rs.getInt("r_num");
			String id = rs.getString("id");
			String r_name = rs.getString("r_name");
			String r_title = rs.getString("r_title");
			Timestamp r_date = rs.getTimestamp("r_date");
			String mov_name = rs.getString("mov_name");
			String r_replay = rs.getString("r_replay");
			int r_hit = rs.getInt("r_hit");
			int r_star = rs.getInt("r_star");
			mv = new MovieVO(r_num, id, r_name, r_title, r_date, mov_name, r_replay, r_hit, r_star);
		} else {
			mv = null;
		}
		
		return mv;
	}
	
	//리뷰 수정
	public boolean update_review(String r_title, String r_replay, int r_num) {
		String sql = "update review set r_title=?, r_replay=? where r_num=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, r_title);
			pstmt.setString(2, r_replay);
			pstmt.setInt(3, r_num);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("update Execaption");
			return false;
		}
		return true;
	}
	
	//리뷰 삭제
	public boolean delete_review(int r_num) {
		String sql = "delete from review where r_num=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, r_num);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("delete Execaption");
			return false;
		}
		return true;
		
	}
	
	//리뷰 작성
	public boolean insert_review(String id, String r_name, String r_title, String r_replay, String mov_name, int r_star) {
		String sql = "insert into review (r_num, id, r_name, r_title, r_replay, mov_name, r_star) values(r_seq.nextval,?,?,?,?,?,?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, r_name);
			pstmt.setString(3, r_title);
			pstmt.setString(4, r_replay);
			pstmt.setString(5, mov_name);
			pstmt.setInt(6, (r_star*10));
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insert Execaption");
			return false;
			
		}
		return true;
		
	}
	
	//조회수
	public boolean hit_update(int r_num) throws NamingException, SQLException {
		String sql = "update review set r_hit = r_hit + 1 where r_num = ?";
			
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, r_num);
			
			pstmt.executeUpdate();			
		} catch (SQLException e) {
			System.out.println("hit_update Execaption");
			return false;
		}
		return true;
	}
	
	
}
