package com.encore.funshop.actions;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.encore.funshop.model.Othello;

public class OthelloAction extends Action {
	private HashMap<String, Othello> map = new HashMap<>();
	int pos[]; //AI가 새로둔 위치 표시
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String action = request.getParameter("action");
		String id = (String) request.getSession().getAttribute("id");
		Othello othello = map.get(id);
		if(othello == null) {
			othello = new Othello();
			map.put(id, othello);
		}
		
		if(action == null || action.equals("loadBoard")) {
			int board[][] = othello.getBoard();
			ArrayList<String> posList = new ArrayList<>();
			for(int i=0; i<8; i++) {
				for(int j=0; j<8; j++) {
					int stone = board[i][j];
					if(stone == 0) continue;
					else {
						posList.add((i+1)+""+(j+1)+":"+stone);
					}
				}
			}
			posList.add(othello.isFinish());
			
			request.setAttribute("posList", posList);
			
			if(pos != null) { ////AI가 새로둔 위치 표시제거
				othello.getBoard()[pos[0]][pos[1]] = 1;
			}
			return mapping.findForward("board");
		} else if(action.equals("putStone")) {
			int i = Integer.parseInt(request.getParameter("i"))-1;
			int j = Integer.parseInt(request.getParameter("j"))-1;
			int stone = Integer.parseInt(request.getParameter("stone"));
			if(othello.isPutable(i, j, stone)) {				
				othello.putStone(i, j, stone);
				response.getWriter().print("success");
			} else {
				response.getWriter().print("fail");
			}
			return null;
		} else if(action.equals("regame")) {
			map.put(id, new Othello());
			pos = null;
			return null;
		} else if(action.equals("reqPut")) {
			int stone = Integer.parseInt(request.getParameter("stone"));
			pos = othello.putStone_AI(stone);
			othello.getBoard()[pos[0]][pos[1]] = 2; //AI가 새로둔 위치 표시
			return null;
		} else {
			return null;
		}
	}
}
