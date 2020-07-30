package egovframework.com.qna.mapper;

import java.util.List;
import java.util.Map;

import egovframework.com.qna.vo.QnaVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("qnaMapper")
public interface QnaMapper {
	List<QnaVo> selectQnaList();
	String selectQnaReplyIdx(QnaVo vo) throws Exception;
	void insertQnaReply(QnaVo vo) throws Exception;
	void updateQnaReply(QnaVo vo) throws Exception;
	void deleteQnaReply(QnaVo vo) throws Exception;
	void deleteQnaAll(QnaVo vo) throws Exception;
}
