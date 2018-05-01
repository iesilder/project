package com.foodtruck.data.dao;


import java.util.ArrayList;
import java.util.List;

import org.bson.Document;
import org.math.R.RserveSession;
import org.math.R.Rsession;
import org.math.R.Rsession.RException;

import com.foodtruck.util.MongoDBUtil;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.MongoIterable;

public class DataDAO {
	public void MongodbGgplot() {
		Rsession rsession = RserveSession.newInstanceTry(System.out, null);
		
		// R라이브러리 등록
		rsession.installPackage("ggplot2", true);
		rsession.installPackage("mongolite", true);
		
		
		
	}// end of Mongodb()
	
	public static void main(String args[]) throws RException {
		//객체 생성
		Rsession rsession = RserveSession.newInstanceTry(System.out, null);
		MongoDatabase mongoDatabase = MongoDBUtil.getConnection("seoulpopulation");
		MongoCollection<Document> mongoCollection = mongoDatabase.getCollection("salesData");
		List<Document> list = null;
		//mongodb에서 데이터를 가져와서 저장하고 그걸 R라이브러리를 이용해서 해결
		
		
		//1. mongodb에서 데이터 가져오기.
		MongoIterable<Document> mongoIterable = mongoCollection.find();
		MongoCursor<Document> mongoCursor = mongoIterable.iterator();
		while(mongoCursor.hasNext()) {
			if(list == null)
				list = new ArrayList<Document>();
			Document instance = mongoCursor.next();
			list.add(instance);
			System.out.println(instance);
			
		}
		
		/*	데이터 확인 완료	*/
		//데이터가 담긴것을 확인
//		for(Document a: list) {
//			System.out.println(a);
//		}
		
		
		//2. 가져온 데이터 R로 처리하기
		
		// R라이브러리 등록
		rsession.installPackage("ggplot2", true);
		rsession.set("mongodata", list);
		
		
		
		//Rsession 닫기
		rsession.end();
		
	}
}
