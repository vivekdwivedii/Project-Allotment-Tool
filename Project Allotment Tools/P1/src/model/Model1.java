package model;

import java.sql.ResultSet;
import java.util.ArrayList;

public class Model1 extends Model
{
	public ArrayList<StuRN1>  getPGData(String c,int s)
	{
		try
		{
			
			ps3.setString(1, c);
			ps3.setInt(2, s);
			ResultSet rs=ps3.executeQuery();
			ArrayList<StuRN1> al=new ArrayList<StuRN1>();
				while(rs.next())
				{
					StuRN1 s1=new StuRN1();
							s1.setGid(rs.getInt(1));
							s1.setRno(rs.getString(2));
							s1.setNames(rs.getString(3));
							al.add(s1);
				}
				rs.close();
				ps3.close();
				connectionClose();
				return al;
		}catch(Exception e)
		{
			return null;
		}
	
	}
}
