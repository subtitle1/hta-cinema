package com.example.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mapper.ChatRoomMapper;
import com.example.vo.ChatRoom;

@Service
@Transactional
public class ChatroomService {

	private ChatRoomMapper chatroomMapper;
	
	void insertChatroom(ChatRoom chatroom) {
		chatroomMapper.insertChatroom(chatroom);
	}
	
	List<ChatRoom> getChatListsByCustomerNo(int no) {
		return chatroomMapper.getChatListsByCustomerNo(no);
	}
}
