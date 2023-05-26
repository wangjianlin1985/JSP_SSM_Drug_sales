package com.chengxusheji.mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Param;
import com.chengxusheji.po.Recipel;

public interface RecipelMapper {
	/*添加处方信息*/
	public void addRecipel(Recipel recipel) throws Exception;

	/*按照查询条件分页查询处方记录*/
	public ArrayList<Recipel> queryRecipel(@Param("where") String where,@Param("startIndex") int startIndex,@Param("pageSize") int pageSize) throws Exception;

	/*按照查询条件查询所有处方记录*/
	public ArrayList<Recipel> queryRecipelList(@Param("where") String where) throws Exception;

	/*按照查询条件的处方记录数*/
	public int queryRecipelCount(@Param("where") String where) throws Exception; 

	/*根据主键查询某条处方记录*/
	public Recipel getRecipel(int recipelId) throws Exception;

	/*更新处方记录*/
	public void updateRecipel(Recipel recipel) throws Exception;

	/*删除处方记录*/
	public void deleteRecipel(int recipelId) throws Exception;

}
