package model;

import java.sql.*;
import java.util.ArrayList;


public class Model 
{
	static Connection c;
	static Statement st;
	static PreparedStatement ps,psi,psf,ps1,ps2,ps3;

	public Model()//Connection Create
	{
			
	try 
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}
	catch (ClassNotFoundException e) 
		{
			System.out.println("Connection not establish");
		}
	try 
		{
		  c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1090");
		  
		}
	catch (SQLException e)
		{
		System.out.println("Connection are not establish successfully");
		}
	try 
		{
			ps=c.prepareStatement("select * from adminCA where NAME=? AND PASS=?");
			psf=c.prepareStatement("select ROLL_NO , SNAME  from student where COURSE=? AND SESS=?");
			psi=c.prepareStatement("insert into student values (?,?,?,?,?,?,?,?)");
			ps1=c.prepareStatement("insert into allotment values (?,?,?,?,?,?,?)");
			ps3=c.prepareStatement("select GID,RNO,GNAME from allotment where COURSE=? AND SESS=?");
			
		}
	catch (SQLException e) 	
		{
		 	e.printStackTrace();
		}
	
	}
	public boolean login(String NAME,String PASS)
	{
		boolean b=false;
		try{
		
		ps.setString(1, NAME);
		ps.setString(2, PASS);
		ResultSet r=ps.executeQuery();
					b=r.next();
					System.out.println(b);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
				
				return b;
	}
	
	
	
	public int insert(String ROLL_NO, String SNAME, String COURSE,int SESS,String YEAR,String SEM,String MOB_NO,String EMAIL)
	{
		int i=0;
			try 
			{
			psi.setString(1, ROLL_NO);
			psi.setString(2, SNAME);
			psi.setString(3, COURSE);
			psi.setInt(4, SESS);
			psi.setString(5, YEAR);
			psi.setString(6, SEM);
			psi.setString(7, MOB_NO);
			psi.setString(8, EMAIL);
			
			i=psi.executeUpdate();
				
			} 
			catch (Exception e)
			{
				e.printStackTrace();
			}
			return i;
	}
	
	
	public ArrayList<StuRN> getSelectedData(String c,int s)
	{
		ArrayList<StuRN> a=new ArrayList<StuRN>();
		try
		{
			psf.setString(1, c);
			psf.setInt(2, s);
			ResultSet rs=psf.executeQuery();
				while(rs.next())
				{
					StuRN s1=new StuRN();
							s1.setRno(rs.getInt("ROLL_NO"));
							s1.setName(rs.getString("SName"));
					
							a.add(s1);
				}
				rs.close();
				connectionClose();
				
		
		}catch(Exception e)
		{
			return a;
		}
		
		return a;
	}
	
	public int allotement(ArrayList<StuRN> al,String c1,int s,String pt,String pguide)
	{
		int flag=0;
			try
			{
				
				ps2=c.prepareStatement("Select RNO from allotment");
				ResultSet rs1=ps2.executeQuery();
				ArrayList<String> rnoList=new ArrayList<String>();
				int z=0;
					while(rs1.next())
					{
						rnoList.add(rs1.getString(1));
						z++;
					}
					ps2.close();
					rs1.close();
					
				String rno="";
				String name="";
				int i=al.size();
				if(i==2)
				{
					StuRN s1=al.get(0);
					StuRN s2=al.get(1);
					
					rno=s1.getRno()+","+s2.getRno();
					name=s1.getName()+","+s2.getName();
					
					for(int x=0;x<rnoList.size();x++)
					{
							String rg=rnoList.get(x);
							String rt[]=rg.split(",");
								int l1=rt.length;
								
								if(l1==2)
								{
									if(Integer.parseInt(rt[0])!=s1.getRno()  &&  Integer.parseInt(rt[1])!=s1.getRno() )
									{
										if(Integer.parseInt(rt[0])!=s2.getRno()  &&  Integer.parseInt(rt[1])!=s2.getRno() )
										{
											flag=1;
										}
									 }
								}
								else
								{
									if(Integer.parseInt(rt[0])!=s1.getRno()  &&  Integer.parseInt(rt[1])!=s1.getRno() && Integer.parseInt(rt[2])!=s1.getRno() )
									{
										if(Integer.parseInt(rt[0])!=s2.getRno()  &&  Integer.parseInt(rt[1])!=s2.getRno() && Integer.parseInt(rt[2])!=s2.getRno())
										{
											flag=2;
										}
									 }
								}
					}
					
				}
				
				
				else
				{
					StuRN s1=al.get(0);
					StuRN s2=al.get(1);
					StuRN s3=al.get(2);
					
					rno=s1.getRno()+","+s2.getRno()+","+s3.getRno();
					name=s1.getName()+","+s2.getName()+","+","+s3.getName();
					
					for(int x=0;x<rnoList.size();x++)
					{
							String rg=rnoList.get(x);
							String rt[]=rg.split(",");
								int l1=rt.length;
								
								
								
								if(l1==2)
								{
									if(Integer.parseInt(rt[0])!=s1.getRno()  &&  Integer.parseInt(rt[1])!=s1.getRno() )
									{
										if(Integer.parseInt(rt[0])!=s2.getRno()  &&  Integer.parseInt(rt[1])!=s2.getRno() )
										{
											if(Integer.parseInt(rt[0])!=s3.getRno()  &&  Integer.parseInt(rt[1])!=s3.getRno())
											flag=3;
										}
									 }
								}
								else
								{
									if(Integer.parseInt(rt[0])!=s1.getRno()  &&  Integer.parseInt(rt[1])!=s1.getRno() && Integer.parseInt(rt[2])!=s1.getRno() )
									{
										if(Integer.parseInt(rt[0])!=s2.getRno()  &&  Integer.parseInt(rt[1])!=s2.getRno() && Integer.parseInt(rt[2])!=s2.getRno())
										{
											if(Integer.parseInt(rt[0])!=s3.getRno()  &&  Integer.parseInt(rt[1])!=s3.getRno() && Integer.parseInt(rt[2])!=s3.getRno())
											flag=4;
										}
									 }
								}
					}
				}
				
					
					
					
				if(flag!=0 || z==0)
				{
				int seq=0;
				st=c.createStatement();
				ResultSet rs=st.executeQuery("Select pmt_seq.NEXTVAL from dual");
				if(rs!=null && rs.next())
					seq=rs.getInt(1);
				
				ps1.setInt(1, seq);
				ps1.setString(2, rno);
				ps1.setString(3, name);
				ps1.setString(5, c1);
				ps1.setInt(4, s);
				ps1.setString(6, pt);
				ps1.setString(7, pguide);
				int j=ps1.executeUpdate();
				//System.out.println(j);
				rs.close();
				st.close();
				connectionClose();
				return 1;
				}
				else
				{
					
					return 0;
				}
			}catch(SQLException e)
			{
				return 0;
			}
		
	}
	public void connectionClose()//that is connection close
	{
						try
						{
							ps.close();
							psi.close();
							psf.close();
							
							c.close();	
						}
						catch (SQLException e)
						{
							System.out.println("Connection is not close");	
						}
					

	}

}
