package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.vo.ChatRoom;
import com.example.vo.Message;

@Mapper
public interface ChatRoomMapper {

	void insertChatroom(ChatRoom chatroom);
	ChatRoom getChatroomByNo(long no);
	List<ChatRoom> getChatListsByCustomerNo(int no);
	void insertMessage(Message message);
	List<ChatRoom> getAllChatRooms();
}
