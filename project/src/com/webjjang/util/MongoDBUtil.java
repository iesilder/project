package com.webjjang.util;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoDatabase;

public class MongoDBUtil {
	// 객체 생성시 필요한 정보
	// 기본 로컬 접속 시
	private static int port = 27017;
	private static String hostName = "localhost";

	// uri를 이용하여 접속 시
	private static String userId = "admin"; // mlab에 접속해서 만든 아이디가 아닌 dababase->user에서 생성한 아이디
	private static String userPw = "1234"; // mlab에 접속해서 만든 아이디가 아닌 dababase->user에서 생성한 비밀번호
	private static String userURI = "@ds029715.mlab.com:29715/seoulpopulation"; // URI의 @부터 끝까지
	// 데이터베이스에 접속 할 때 필요한 user id와 pw를 uri문장에 합쳐준다.
	private static String mlabUri = "mongodb://" + userId + ":" + userPw + userURI;

	// // 접속을 시도 할 데이터 베이스의 정보
	// private static String databaseName = "seoulpopulation";

	// close를 안하여 나타나는 오류를 없애기 위해 만든 외부 객체
	// 로컬 접속 시 사용할 MongoClient 객체
	static MongoClient mongoClient = new MongoClient(hostName, port);
	// mLab을 이용하여 접속 할 때 이용할 uri와 MongoClient 객체
	static MongoClientURI uri = new MongoClientURI(mlabUri);
	static MongoClient mongoClient1 = new MongoClient(uri);

	// 접속 시 필요한 자료
	// 접속 시 databaseName을 파라메터로 넘겨서 접속한다.
	public static MongoDatabase getConnection(String databaseName) {
		return mongoClient.getDatabase(databaseName);
	}// end of getConnection()

	// URI 접속 시 필요한 자료
	// 접속 시 databaseName을 파라메터로 넘겨서 접속한다.
	public static MongoDatabase getConnectionToMlab() {
		return mongoClient1.getDatabase(uri.getDatabase());
	}// end of getConnectionToMlab()

}