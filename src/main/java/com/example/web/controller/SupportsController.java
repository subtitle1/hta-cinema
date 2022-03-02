package com.example.web.controller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.annotation.LoginedUser;
import com.example.service.ChatroomService;
import com.example.service.QnaService;
import com.example.service.TheaterService;
import com.example.vo.ChatRoom;
import com.example.vo.Customer;
import com.example.vo.Message;
import com.example.vo.QnaType;
import com.example.vo.Region;

@Controller
@RequestMapping("/supports")
public class SupportsController {

	@Autowired
	private TheaterService theaterService;
	@Autowired
	private QnaService qnaService;
	@Autowired
	private ChatroomService chatroomService;
	
	static final Logger logger = LogManager.getLogger(SupportsController.class);
	
	@GetMapping
	public String supports() {
		return "/supports/faq";
	}
	
	@GetMapping("/inquiry")
	public String inquiry(Model model) {
		
		List<Region> regions = theaterService.getAllRegion();
		List<QnaType> categories = qnaService.getAllCategories();
		
		model.addAttribute("regions", regions);
		model.addAttribute("categories", categories);
		
		return "/supports/inquiry";
	}
	
	@GetMapping("/chat")
	public String chat(Model model, @LoginedUser Customer customer) {
		
		if (customer.getNo() == 100000048) {
			model.addAttribute("chatList", chatroomService.getAllChatrooms());
		} else {
			model.addAttribute("chatList", chatroomService.getChatListsByCustomerNo(customer.getNo()));
		}
		return "/supports/chat";
	}
	
	@GetMapping("/chatroom")
	public String chatRoom(int no) {
		return "/supports/chatroom";
	}
	
	@PostMapping("/chatroom") 
	public @ResponseBody ChatRoom startChat(ChatRoom chatroom, @LoginedUser Customer customer) {
		chatroom.setCustomerNo(customer.getNo());
		chatroom.setAdminNo(100000048);
		chatroomService.insertChatroom(chatroom);
		return chatroomService.getChatRoomByNo(chatroom.getChatroomNo());
	}
	
	@PostMapping("/message")
	public Message message(@RequestBody Message message, @LoginedUser Customer customer) {
		chatroomService.insertMessage(message);
		return message;
	}
}
