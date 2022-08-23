package com.skilldistillery.interviewassister.data;

import com.skilldistillery.interviewassister.entities.Option;

public interface OptionDAO {

	Option createOption(Option option, int questionId);
	Option updateOption(int optionId, Option option);
	boolean deleteOption(int optionId);
}
