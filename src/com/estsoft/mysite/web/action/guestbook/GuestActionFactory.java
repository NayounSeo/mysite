package com.estsoft.mysite.web.action.guestbook;

import com.estsoft.mysite.web.action.guestbook.DefaultAction;
import com.estsoft.web.action.Action;
import com.estsoft.web.action.ActionFactory;

public class GuestActionFactory extends ActionFactory {

	@Override
	public Action getAction(String actionName) {
		Action action = null;
		if ("deleteform".equals(actionName)) {
			action = new DeleteFormAction();
		} else if ("delete".equals(actionName) ) {
			action = new DeleteAction();
		} else if ("insert".equals(actionName) ) {
			action = new InsertAction();
		} else {
			action = new DefaultAction();
		}
		return action;
	}

}
