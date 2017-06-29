package com.github.mahui53541.scsms.domain;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.PostConstruct;

import com.github.mahui53541.scsms.dao.TranscriptDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
public class Transcript {
	private HashMap<String,ArrayList<TranscriptEntity>> map;
	public Transcript() {
		super();
		// TODO Auto-generated constructor stub
		map=new HashMap<String,ArrayList<TranscriptEntity>>();
	}
	@PostConstruct
	public void init(){
		ArrayList<TranscriptEntity> list=load();
		int size=list.size();
		HashMap<String,ArrayList<TranscriptEntity>> hashmap=new HashMap<String,ArrayList<TranscriptEntity>>();
		for(int i=0;i<size;i++){
			String ssn=list.get(i).getStudent().getSsn();
			if(hashmap.get(ssn)==null){
				ArrayList<TranscriptEntity> transcript=new ArrayList<TranscriptEntity>();
				transcript.add(list.get(i));
				hashmap.put(ssn, transcript);
			}else{
				hashmap.get(ssn).add(list.get(i));
			}
		}
		this.map=hashmap;
	}
	@Autowired
	private TranscriptDao transcriptDao;
	private ArrayList<TranscriptEntity> load() {
		// TODO Auto-generated method stub
		ArrayList<TranscriptEntity> list=transcriptDao.load();
		return list;
	}
	public HashMap<String, ArrayList<TranscriptEntity>> getMap() {
		return map;
	}
	
}
