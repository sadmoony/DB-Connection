package ua.edu.sumdu;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.LinkedList;
import java.io.PrintWriter;
import java.sql.*;


@WebServlet(name="Default", urlPatterns = {"/"}, loadOnStartup = 1)
public class StudentAdd extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter pw = null;
        try{
            pw = response.getWriter();
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e){
            e.printStackTrace(pw);
            pw.print(e.getMessage());
        }
        
        Connection con = null;
       try{
            con = DriverManager.getConnection("jdbc:mysql://localhost:3311/university", "root", "root");
            
            if (request.getParameter("name") != null && request.getParameter("surname") != null){
                PreparedStatement ps = con.prepareStatement("INSERT INTO student (name, surname, age, email, group_, faculty)" + 
                                                            "VALUES (?, ?, ?, ?, ?, ?)");
                ps.setString(1, request.getParameter("name"));
                ps.setString(2, request.getParameter("surname"));
                ps.setString(3, request.getParameter("age"));
                ps.setString(4, request.getParameter("email"));
                ps.setString(5, request.getParameter("group_"));
                ps.setString(6, request.getParameter("faculty"));
                ps.executeUpdate();
                response.sendRedirect("./");
            }
            
            Statement s = con.createStatement();
            ResultSet rs = s.executeQuery("SELECT * FROM student");
            List<Student> students = new LinkedList<Student>();
            
            while(rs.next()){
                Student student = new Student(rs.getString(2), rs.getString(3), rs.getString(4),
                                              rs.getString(5), rs.getString(6), rs.getString(7));
                students.add(student);
            }
            
            request.setAttribute("students", students);
            request.getRequestDispatcher("view.jsp").forward(request, response);    
            
        }catch(SQLException e){
            pw.print(e.getMessage());
        }catch(Exception e){
            e.printStackTrace();
        } finally {
           if (con != null){
               try {
                   con.close();
               } catch(SQLException e){
                   e.getMessage();
               }
           }
       }
       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
}
