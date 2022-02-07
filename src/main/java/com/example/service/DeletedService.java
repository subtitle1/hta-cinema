package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mapper.DeletedMapper;
import com.example.vo.Movie;
import com.example.web.form.TicketNoForm;

@Service
public class DeletedService {

	@Autowired
	private DeletedMapper deletedDto;
	
	public void deletedDto(TicketNoForm form) {
		deletedDto.deletedTicketForm(form);
		deletedDto.deletedTicketSeat(form);
		Movie movie = deletedDto.getMovieNo(form.getMovieNo());
		movie.setNo(form.getMovieNo());
		movie.setMovieAudienceTotalNumber(movie.getMovieAudienceTotalNumber()-form.getMovieAudienceTotalNumber());
		deletedDto.updateMovieTotalNumber(movie);
	}
}
