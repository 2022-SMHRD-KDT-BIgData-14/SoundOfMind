package com.SoundOfMind.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.SoundOfMind.domain.Coment;
import com.SoundOfMind.domain.Storege;

@Mapper
public interface StoregeMapper {
	public List<Storege> comushow();

	public Storege board(int s_index);

	public List<Coment> boardComent(int storege_id);

	public int coment(int storege_id, String coments, String id);
}
