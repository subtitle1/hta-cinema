package com.example.mapper;

public interface MyMovieMapper {

	void saveLike(MyMovieMapper myMovie);
	void upLike(int movieNo);
	void deleteLike(MyMovieMapper myMovie);
	void downLike(int movieNo);
	int getLikeCount(int movieNo);
}
