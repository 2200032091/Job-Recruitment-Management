package com.DAO;

import java.util.*;
import com.entity.*;
import java.sql.*;
public class JobDAO {

	private Connection conn;
	
	public JobDAO(Connection conn)
	{
		super();
		this.conn=conn;
	}
	
	public boolean addJobs(Jobs j)
	{
		boolean f=false;
		try {
			
			String sql="insert into jobs(title,description,category,status,location) values (?,?,?,?,?)";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1,j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			ps.setString(5,j.getLocation());
			
			int i=ps.executeUpdate();
			
			if(i==1)
			{
				f=true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	
	
	public List<Jobs> getAllJobs(){
		List<Jobs> list =new ArrayList<Jobs>();
		Jobs j=null;
		try {
			String sql="Select * from jobs order by id desc";
			PreparedStatement ps= conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+"");
				
				list.add(j);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	public Jobs getJobById(int id){
		
		Jobs j=null;
		try {
			String sql="Select * from jobs where id=? ";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+"");
				
				
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return j;
	}
	
	public boolean updateJob(Jobs j)
	{
		boolean f=false;
		try {
			
			String sql="update jobs  set title=?,description=?,category=?,status=?,location=? where id=?";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1,j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			ps.setString(5,j.getLocation());
			ps.setInt(6,j.getId());
			
			int i=ps.executeUpdate();
			
			if(i==1)
			{
				f=true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	
	
	public boolean deleteJobs(int id)
	{
		boolean f=false;
		
		try {
			
			String sql="delete from jobs where id=?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	
	
	public List<Jobs>  getAllJobsForUser(){
		
		List<Jobs> list =new ArrayList<Jobs>();
		Jobs j=null;
		try {
			String sql="Select * from jobs where status=? order by id desc";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+"");
				
				list.add(j);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return list;
	}
	
	
public List<Jobs>  getJobsORLocationAndCate(String category,String location){
		
		List<Jobs> list =new ArrayList<Jobs>();
		Jobs j=null;
		try {
			String sql="Select * from jobs where category=? or location=? order by id desc";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1,category);
			ps.setString(2, location);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+"");
				
				list.add(j);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return list;
	}
	


public List<Jobs>  getJobsAndLocationAndCate(String category,String location){
	
	List<Jobs> list =new ArrayList<Jobs>();
	Jobs j=null;
	try {
		String sql="Select * from jobs where category=? and location=? order by id desc";
		PreparedStatement ps= conn.prepareStatement(sql);
		ps.setString(1,category);
		ps.setString(2, location);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			j=new Jobs();
			j.setId(rs.getInt(1));
			j.setTitle(rs.getString(2));
			j.setDescription(rs.getString(3));
			j.setCategory(rs.getString(4));
			j.setStatus(rs.getString(5));
			j.setLocation(rs.getString(6));
			j.setPdate(rs.getTimestamp(7)+"");
			
			list.add(j);
		}
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	
	return list;
}


//In JobDAO class
public void deleteJobApplications(int jobId) {
 String query = "DELETE FROM job_applications WHERE job_id = ?";
 try (PreparedStatement ps = conn.prepareStatement(query)) {
     ps.setInt(1, jobId);
     ps.executeUpdate();
 } catch (SQLException e) {
     e.printStackTrace();
 }
}


}
