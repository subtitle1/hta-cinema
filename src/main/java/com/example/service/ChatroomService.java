package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mapper.ChatRoomMapper;
import com.example.vo.ChatRoom;
import com.example.vo.Message;

@Service
@Transactional
public class ChatroomService {

	@Autowired
	private ChatRoomMapper chatroomMapper;
	
	public void insertChatroom(ChatRoom chatroom) {
		chatroomMapper.insertChatroom(chatroom);
	}
	
	public ChatRoom getChatRoomByNo(long no) {
		return chatroomMapper.getChatroomByNo(no);
	}
	
	public List<ChatRoom> getChatListsByCustomerNo(int no) {
		return chatroomMapper.getChatListsByCustomerNo(no);
	}
	
	public void insertMessage(Message message) {
		chatroomMapper.insertMessage(message);
	}
	
	public List<ChatRoom> getAllChatrooms() {
		return chatroomMapper.getAllChatRooms();
	}
}
