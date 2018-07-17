package com.iter_club.forum.util.temp;

import com.iter_club.forum.entity.Question;

import java.util.List;

/**
 * Created by AsherLi
 */
public class QuestionViewModel extends Question {
    public UserViewModel userforum;   //发布者
    public List<AnswerViewModel> answers;  //回答
}
