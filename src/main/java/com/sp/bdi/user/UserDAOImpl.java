package com.sp.bdi.user;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private SqlSessionFactory ssf;
	
	@Override
	public List<Map<String, String>> selectUserList() {
		SqlSession ss = ssf.openSession();
		try {
			return ss.selectList("com.sp.bdi.dao.UserInfoMapper.selectUserInfoList");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ss.close();
		}
		return null;
	}

	@Override
	public List<UserVO> selectUserVOList(UserVO user) {
		SqlSession ss = ssf.openSession();
		try {
			return ss.selectList("com.sp.bdi.dao.UserInfoMapper.selectUserInfoList",user);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ss.close();
		}
		return null;
	}

	@Override
	public int insertUserInfo(UserVO user) {
		SqlSession ss = ssf.openSession();
		try {
			int cnt = ss.insert("com.sp.bdi.dao.UserInfoMapper.insertUserInfo",user);
			ss.commit();
			return cnt;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ss.close();
		}
		return 0;
	}

	@Override
	public int updateUserInfo(UserVO user) {
		SqlSession ss = ssf.openSession();
		try {
			return ss.update("com.sp.bdi.dao.UserInfoMapper.updateUserInfo",user);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ss.close();
		}
		return 0;
	}

	@Override
	public int deleteUserInfos(UserVO user) {
		SqlSession ss = ssf.openSession();
		try {
			int cnt = ss.delete("com.sp.bdi.dao.UserInfoMapper.deleteUserInfos",user);
			if(cnt!=user.getUiNums().length) {
				ss.rollback();
				return 0;
			}
			ss.commit();
			return cnt;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ss.close();
		}
		return 0;
	}

	@Override
	public UserVO selectUserInfo(UserVO user) {
		SqlSession ss = ssf.openSession();
		try {
			return ss.selectOne("com.sp.bdi.dao.UserInfoMapper.selectUserInfo", user);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ss.close();
		}
		return null;
	}


}
