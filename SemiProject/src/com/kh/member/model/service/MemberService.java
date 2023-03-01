package com.kh.member.model.service;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Booking;
import com.kh.member.model.vo.Member;

public class MemberService {
	
	public Member loginMember(String memberId, String memberPwd) {
		
		
		Connection conn = getConnection();
		
		
		Member m = new MemberDao().loginMember(conn, memberId, memberPwd);
		
		
		close(conn);
		
		
		return m;
	}

	public int idCheck(String checkId) {
		Connection conn = getConnection();
		
		int count = new MemberDao().idCheck(conn, checkId);
		
		close(conn);
		
		return count;
	}
	
	public int emailCheck(String checkEmail) {
		Connection conn = getConnection();
		
		int count = new MemberDao().emailCheck(conn, checkEmail);
		
		close(conn);
		
		return count;
	}
	
	public int insertMember(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Member findMemberId(String memberName, String email, String phone) {
		
		Connection conn = getConnection();
		
		Member m = new MemberDao().findId(conn, memberName, email, phone);
		
		close(conn);
		
		
		
		return m;
	}
	
	public Member findMemberPwd(String memberId, String memberName, String email) {
		
		Connection conn = getConnection();
		
		Member m = new MemberDao().findPwd(conn, memberId, memberName, email);
		
		close(conn);
		
		System.out.println("service : " + m);
		return m;
	}



	
	
	/* ------------ 박대석------------------------------*/
	public ArrayList<Booking> selectListBooking(int memberNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Booking> list = new MemberDao().selectListBooking(conn, memberNo);
		
		close(conn);
		
		return list;
		
	}

	public ArrayList<Booking> selectSearchBookNo(int memberNo, int bookNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Booking> list = new MemberDao().selectSearchBookNo(conn, memberNo, bookNo);
		
		close(conn);
		
		return list;
	}
	
	public Member loadMemberInfo(int memberNo) {
		
		Connection conn = getConnection();
		
		Member m = new MemberDao().loadMemberInfo(conn, memberNo);
		
		close(conn);
		
		return m;
	}

	public int reservationCancel(int bookNo, int memberNo) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().reservationCancel(conn, bookNo, memberNo);
		
		if(result>0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	

	public Member updatePwdMember(String userId, String userPwd, String updatePwd) {
		
		Connection conn = getConnection();
		
		// 비밀번호 update 관련 dao 메소드를 먼저 호출
		int result = new MemberDao().updatePwdMember(conn, userId, userPwd, updatePwd);
		
		// 호출 결과에 따라서 성공이면 commit 후에 새로 바뀐 회원의 정보를 다시 받아온다.
		Member updateMem = null;
		
		if(result > 0) { // 성공
			commit(conn);
			
			// 갱신된 회원 객체를 다시 받아오기
			updateMem = new MemberDao().selectMember(conn, userId);
		}
		else { // 실패
			rollback(conn);
		}
		
		close(conn);
		
		return updateMem;
	}

	
	public Member updateMember(Member m, String birth) {
		
		Connection conn = getConnection();
		
		System.out.println("servicePhone : "+m.getPhone());
		int result = new MemberDao().updateMember(conn, m, birth);
		
		// 갱신된 회원 객체를 다시 조회해오기 => 업데이트 성공한 경우에만
		Member updateMem = null;
		
		if(result > 0) { // 성공
			
			commit(conn);
			
			updateMem = new MemberDao().selectMember2(conn, m.getMemberName());
		}
		else { // 실패
			rollback(conn);
		}
		
		return updateMem;
	}
	// --------------------------박대석------------------------------------------
	
}
