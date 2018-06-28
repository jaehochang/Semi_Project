package kh.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kh.web.dto.TagDTO;
import kh.web.utils.DBUtils;

public class TagDAO {

	public TagDTO printTag(String term) throws Exception {
		System.out.println("db : " + term);
		Connection con = DBUtils.getConnection();
		String sql = "select * from tag where tag_category like ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, "%"+term+"%");
		

		ResultSet rs = pstat.executeQuery();
		TagDTO tdto= new TagDTO();
		
		
		if(rs.next()) {
			System.out.println(1);
			tdto.setTag_category_words(rs.getString("tag_category_words"));
		}
        System.out.println("db카테고리:"+tdto.getTag_category_words());
		con.close();
		pstat.close();
		rs.close();

		return tdto;
	}
	

	
	
}
