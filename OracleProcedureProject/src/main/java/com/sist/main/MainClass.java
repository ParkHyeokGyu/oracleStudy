package com.sist.main;

import java.util.List;

import com.sist.dao.EmpDAO;
import com.sist.dao.EmpVO;

public class MainClass {
	public static void main(String[] args) {
		EmpDAO dao=new EmpDAO();
		List<EmpVO> list=dao.empAllData();
		for(EmpVO vo:list) {
			System.out.println(vo.getEmpno()+" "
					+vo.getEname()+" "
					+vo.getJob()+" "
					+vo.getHiredate()+" "
					+vo.getSal());
		}
	}
}
