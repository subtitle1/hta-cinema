package com.example.mapper;

import com.example.vo.Movie;
import com.example.web.form.TicketNoForm;
import com.example.web.form.TicketingForm;

public interface DeletedMapper {

	public void deletedTicketForm(TicketNoForm form);
	public void deletedTicketSeat(TicketNoForm form);
	public void updateMovieTotalNumber(Movie movie);
	public Movie getMovieNo(int movieNo);
}
