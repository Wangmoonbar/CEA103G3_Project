/*
 *  1. �U�νƦX�d��-�i�ѫȤ���H�N�W�����Q�d�ߪ����
 *  2. ���F�קK�v�T�į�:
 *     �ҥH�ʺA���͸U��SQL������,���d�ҵL�N�ĥ�MetaData���覡,�]�u�w��ӧO��Table�ۦ���ݭn�ӭӧO�s�@��
 * */
package jdbc.util.CompositeQuery;

import java.util.*;

public class jdbcUtil_CompositeQuery_Showtime {

	public static String get_aCondition_For_myDB(String columnName, String value) {

		String aCondition = null;
		
		if ("movie_no".equals(columnName) ) // �Ω��L
			aCondition = columnName + "=" + value;
		else if("showtime_time".equals(columnName))
			aCondition = "date(" + columnName + ")  = " + "'" + value + "'"; 
		return aCondition + " ";
	}

	public static String get_WhereCondition(Map<String, String[]> map) {
		Set<String> keys = map.keySet();
		StringBuffer whereCondition = new StringBuffer();
		int count = 0;
		for (String key : keys) {
			String value = map.get(key)[0];
			if (value != null && value.trim().length() != 0	&& !"action".equals(key)) {
				count++;
				String aCondition = get_aCondition_For_myDB(key, value.trim());

				if (count == 1)
					whereCondition.append(" where " + aCondition);
				else
					whereCondition.append(" and " + aCondition);

				System.out.println("���e�X�d�߸�ƪ�����count = " + count);
			}
		}
		return whereCondition.toString();
	}

	public static void main(String argv[]) {

		// �t�X req.getParameterMap()��k �^�� java.util.Map<java.lang.String,java.lang.String[]> ������
		Map<String, String[]> map = new TreeMap<String, String[]>();
		map.put("movie_no", new String[] { "1" });
		map.put("showtime_time", new String[] { "2021-04-05" });
		map.put("action", new String[] { "getXXX" }); // �`�NMap�̭��|�t��action��key
		String finalSQL = "select * from showtime "
				          + jdbcUtil_CompositeQuery_Showtime.get_WhereCondition(map)
				          + "order by showtime_no";
		System.out.println("����finalSQL = " + finalSQL);
	}
}