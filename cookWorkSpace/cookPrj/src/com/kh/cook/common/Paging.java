package com.kh.cook.common;

import java.util.List;

import com.kh.cook.member.service.AdminService;
import com.kh.cook.member.vo.MemberVo;

public class Paging {
	public static PageVo paging(int pno, MemberVo vo) {
		//페이징 처리
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new AdminService().selectCount(vo);
		currentPage = pno;
		pageLimit = 2;
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		
		
		PageVo pvo = new PageVo();
		pvo.setListCount(listCount);
		pvo.setCurrentPage(currentPage);
		pvo.setPageLimit(pageLimit);
		pvo.setBoardLimit(boardLimit);
		
		pvo.setMaxPage(maxPage);
		pvo.setStartPage(startPage);
		pvo.setEndPage(endPage);
		
		int start = (pvo.getCurrentPage() - 1) * pvo.getBoardLimit() + 1;
		int end = start + pvo.getBoardLimit() - 1;
		
		pvo.setEnd(end);
		pvo.setStart(start);
		

		return pvo;
	}
}
