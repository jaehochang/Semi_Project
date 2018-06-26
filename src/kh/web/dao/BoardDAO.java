package kh.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kh.web.dto.BoardDTO;
import kh.web.utils.DBUtils;

public class BoardDAO {
	public List<BoardDTO> getBoardData() throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from meeting";
		PreparedStatement pstat = con.prepareStatement(sql);
		
		List<BoardDTO> result = new ArrayList<>();
		ResultSet rs = pstat.executeQuery();
		
		while(rs.next()) {
			BoardDTO dto = new BoardDTO();
			dto.setBoard_seq(rs.getInt("board_seq"));
			dto.setGroup_seq(rs.getInt("group_seq"));
			dto.setGroup_name(rs.getString("group_name"));
			dto.setGroup_leader(rs.getString("group_leader"));
			dto.setBoard_title(rs.getString("board_title"));
			dto.setBoard_content(rs.getString("board_content"));
			dto.setAttend_date(rs.getString("attend_date"));
			dto.setLocation(rs.getString("location"));
			result.add(dto);
		}
		rs.close();
		pstat.close();
		con.close();
		return result;
	}
	
	public BoardDTO getEachMeetingData(int board_seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from meeting where board_seq = ? ";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, board_seq);
		ResultSet rs = pstat.executeQuery();
		
		BoardDTO dto = new BoardDTO();
		
		while(rs.next()) {
			dto.setBoard_seq(rs.getInt("board_seq"));
			dto.setGroup_seq(rs.getInt("group_seq"));
			dto.setGroup_name(rs.getString("group_name"));
			dto.setGroup_leader(rs.getString("group_leader"));
			dto.setBoard_title(rs.getString("board_title"));
			dto.setBoard_content(rs.getString("board_content"));
			dto.setAttend_date(rs.getString("attend_date"));
			dto.setLocation(rs.getString("location"));
			
		}
		
		return dto;
	}
	
}
