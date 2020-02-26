package movieVO;

import java.util.Date;
import java.sql.Timestamp;


public class MovieVO {
	//속성
	private int 	join_no;
	private String	id;
	private String	password;
	private String	name;
	private Date	birthd;
	private String	email;
	private String	tel;
	
	private int r_num;       	//작성 일련번호
	private String r_name;		//글 작성자
	private String r_title;      //글 제목
	private String r_replay;      //글 내용
	private Timestamp r_date;    //작성일
	private int r_hit;         	//조회수
	private String mov_name;    //영화이름
	private int r_star;			//별점
	
	private String sub_name;
	private String p_image;
	private String p_trailer;
	private String p_content;
	private String p_dir;
	private String p_app;
	private String p_grade;
	private String p_summary;
	private String p_photo1;
	private String p_photo2;
	private String p_photo3;
	
	

	//생성자
	public MovieVO() {}
	public MovieVO(int join_no, String id, String password, String name, Date birthd, String email, String tel) {
		this.join_no 	= join_no;
		this.id			= id;
		this.password 	= password;
		this.name		= name;
		this.birthd		= birthd;
		this.email		= email;
		this.tel		= tel;
	}
	

	public MovieVO(int r_num, String id, String r_name, String r_title, Timestamp r_date, String mov_name, String r_replay, int r_hit, int r_star) {
		this.r_num		= r_num;
		this.id 		= id;
		this.r_name		= r_name;
		this.r_title	= r_title;
		this.r_date		= r_date;
		this.mov_name	= mov_name;
		this.r_replay	= r_replay;
		this.r_hit		= r_hit;
		this.r_star		= r_star;
	}
	
	
	public MovieVO(String mov_name, String sub_name, String p_image, String p_trailer, String p_content, String p_dir, String p_app,String p_grade, String p_summary, String p_photo1, String p_photo2, String p_photo3) {
		
		this.mov_name	= mov_name;
		this.sub_name	= sub_name;
		this.p_image	= p_image;
		this.p_trailer	= p_trailer;
		this.p_content	= p_content;
		this.p_dir		= p_dir;
		this.p_app		= p_app;
		this.p_grade	= p_grade;
		this.p_summary	= p_summary;
		this.p_photo1	= p_photo1;
		this.p_photo2	= p_photo2;
		this.p_photo3	= p_photo3;
	}


	//get set
	public int getJoin_no() {
		return join_no;
	}
	public void setJoin_no(int join_no) {
		this.join_no = join_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirthd() {
		return birthd;
	}
	public void setBirthd(Date birthd) {
		this.birthd = birthd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_title() {
		return r_title;
	}
	public void setR_title(String r_title) {
		this.r_title = r_title;
	}
	public String getR_replay() {
		return r_replay;
	}
	public void setR_replay(String r_replay) {
		this.r_replay = r_replay;
	}
	public Timestamp getR_date() {
		return r_date;
	}
	public void setR_date(Timestamp r_date) {
		this.r_date = r_date;
	}
	public int getR_hit() {
		return r_hit;
	}
	public void setR_hit(int r_hit) {
		this.r_hit = r_hit;
	}
	public int getR_star() {
		return r_star;
	}
	public void setR_star(int r_star) {
		this.r_star = r_star;
	}
	public String getMov_name() {
		return mov_name;
	}
	public void setMov_name(String mov_name) {
		this.mov_name = mov_name;
	}
	public String getSub_name() {
		return sub_name;
	}
	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}
	public String getP_image() {
		return p_image;
	}
	public void setP_image(String p_image) {
		this.p_image = p_image;
	}
	public String getP_trailer() {
		return p_trailer;
	}
	public void setP_trailer(String p_trailer) {
		this.p_trailer = p_trailer;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public String getP_dir() {
		return p_dir;
	}
	public void setP_dir(String p_dir) {
		this.p_dir = p_dir;
	}
	public String getP_app() {
		return p_app;
	}
	public void setP_app(String p_app) {
		this.p_app = p_app;
	}
	public String getP_grade() {
		return p_grade;
	}
	public void setP_grade(String p_grade) {
		this.p_grade = p_grade;
	}
	public String getP_summary() {
		return p_summary;
	}
	public void setP_summary(String p_summary) {
		this.p_summary = p_summary;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getP_photo1() {
		return p_photo1;
	}
	public void setP_photo1(String p_photo1) {
		this.p_photo1 = p_photo1;
	}
	public String getP_photo2() {
		return p_photo2;
	}
	public void setP_photo2(String p_photo2) {
		this.p_photo2 = p_photo2;
	}
	public String getP_photo3() {
		return p_photo3;
	}
	public void setP_photo3(String p_photo3) {
		this.p_photo3 = p_photo3;
	}
	
	//암호 변경 기능 구현용
	public boolean matchPassword(String pwd) {
		return password.equals(pwd);
	}

	
}
