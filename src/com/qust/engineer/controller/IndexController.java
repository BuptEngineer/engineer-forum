package com.qust.engineer.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.json.Json;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qust.engineer.dao.CategoryMapper;
import com.qust.engineer.dao.PostMapper;
import com.qust.engineer.dao.UserMapper;
import com.qust.engineer.pojo.Post;
import com.qust.engineer.pojo.TrieTree;

@Controller
public class IndexController {
	@Autowired
	private PostMapper postMapper;
	@Autowired
	private UserMapper userMapper;	
	@Autowired
	CategoryMapper ctgMapper;
	private TrieTree trieTree;
	
	@ResponseBody
	@RequestMapping({"/page"}) // 首页帖子应该有排序算法
	public PageInfo<Post> SearchPostsAccordingTitle(String page,String key) throws UnsupportedEncodingException{
		int pageNum=1;
		if(page!=null) 
			pageNum=Integer.parseInt(page);
		String keyword=key==null?"":key;
		PageHelper.startPage(pageNum, 2);
		List<Post> postsLinked=postMapper.selectByTitle(keyword);
		if(trieTree==null){//第一次时候载入内存
			trieTree=new TrieTree();
			for(Post p:postsLinked){
				trieTree.insert(p.getpName());
			}
		}
		PageInfo<Post> pageInfo=new PageInfo<>(postsLinked,5);//连续显示5页
		return pageInfo;
	}
	
	@RequestMapping("/completion")
	@ResponseBody
	public List<String> completion(String word,Boolean insert){
		return trieTree.query(word,insert);
	}
}
