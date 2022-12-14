<%@page import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Students</title>
        
        <style>
            h1{
                text-align: center;
            }
            
            #page{
                width: 800px;
                margin: auto;
            }
            
            form{
                width: 400px;
                margin: 20 px auto;
            }
            
            input [type = submit]{
                margin: auto;
            }
            
            .list, .list td, .list th{
                margin: auto;
                border: 1px solid black;
                border-collapse: collapse;
            }
            
            .list td, .list th{
                padding: 10px;
            }
            
            body{
                background-color: gray;
            }
        </style>
        
    </head>
    
    <body>
        
        <div id = "page">
            <h1>Hello!</h1>
            
            <form method="post" action="StudentAdd">
                
                <table>
                    <tbody>
                        
                        <tr>
                            <td> <label for = "name" >Name</label></td>
                            <td> <input id="name" type="text" name="name"></td>
                        </tr>
                        
                        <tr>
                            <td><label for="surname">Surname</label></td>
                            <td><input id="surname" type="text" name="surname"></td>
                        </tr>
                        
                        <tr>
                            <td><label for="age">Age</label></td>
                            <td><input id="age" type="text" name="age"></td>
                        </tr>
                        
                        <tr>
                            <td><label for="email">Email</label></td>
                            <td><input id="email" type="email" name="email"></td>
                        </tr>
                        
                        <tr>
                            <td><label for="group_">Group</label></td>
                            <td><input id="group" type="text" name="group_"></td>
                        </tr>
                        
                        <tr>
                            <td><label for="faculty">Faculty</label></td>
                            <td><input id="faculty" type="text" name="faculty"></td>
                        </tr>
                        
                    </tbody>
                </table>
                
                <input type="submit" name="send" value="Send">
                
            </form>
            
            <c:if test="${students.size() > 0}">
                
                <table class="list">
                    
                    <tr>
                        <th>Name</th>
                        <th>Surname</th>
                        <th>Age</th>
                        <th>Email</th>
                        <th>Group</th>
                        <th>Faculty</th>
                    </tr>
                    
                    <c:forEach var="student" items="${students}">
                        
                        <tr>
                            <td><c:out value="${student.getName()}"/></td>
                            <td><c:out value="${student.getSurname()}"/></td>
                            <td><c:out value="${student.getAge()}"/></td>
                            <td><c:out value="${student.getEmail()}"/></td>
                            <td><c:out value="${student.getGroup()}"/></td>
                            <td><c:out value="${student.getFaculty()}"/></td>
                        </tr>
                        
                    </c:forEach>
                    
                </table>
                
            </c:if>
            
        </div>
        
    </body>
    
</html>
