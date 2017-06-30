<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.driver.*" %>
<%@ page import="oracle.sql.*" %>
<%@ page import="oracle.jdbc.driver.OracleDriver"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.naming.*" %>

<!DOCTYPE html>

<html>
    <head>
        <script type="text/javascript" src="../js/jquery-2.2.4.js"></script>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
        <script src="../js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Offer</title>     
    </head>
    <body>
        <div class="container">
            <form action="manager" method="post">
                <h2>Welcome to the Loyalty Manager !!</h2>

                <br></br>

                <div class="form-group col-xs-8">
                    <label for="offer" class="control-label col-xs-4">Input Offer Criteria:</label>
                    <input type="text" name="offer"/>
                    <button type="submit" class="btn btn-primary  btn-md">Search</button>                                   
                   
                    <br></br>
                  
                    <label for="target" class="control-label col-xs-4"># of Target Customers:</label>  
                    <input type="text" name="target" disabled="disabled" value="${result}"/>
                </div>
            </form>

            <form action="manager" method="post">        
                <div class="form-group col-xs-8">
                    <br></br>

                    <label for="target" class="control-label col-xs-4">Target Product:</label>


                    <select name="item">
                      <option value="1">Red</option>
                      <option value="2">Blue</option>
                      <option value="3">Green</option>
                    </select>
                    
                    <br></br>
                    <br></br>
                    
                  <button type="submit" class="btn btn-primary  btn-md">Submit</button>
                  
                  <button type="submit" class="btn btn-primary  btn-md">Clear</button>
                </div>
            </form>
            
  

<%
            InitialContext ctx;
            DataSource ds;
            Connection conn;
            Statement st;
            ResultSet rs;
              
//            String username = request.getParameter("sys");
//            String password = request.getParameter("Alpha2014_");
//            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//141.144.83.181:1521/PDB1.gse00010885.oraclecloud.internal", username, password);


            try {
                  ctx = new InitialContext();
                  ds = (DataSource) ctx.lookup("jdbc/loyaltyDS");
                  conn = ds.getConnection();

                  st = conn.createStatement();
                  rs = st.executeQuery("SELECT * FROM CUSTOMER");
                    
                  int i = 0;
                  int points = 0;
                    
                  while(rs.next())
                  {       
                    points = rs.getInt("POINTS");

                    if(points < 30000)
                    {
                      i++;
                      out.println(points);
                    }
//                    out.print("Customer Name: "+ rs.getString("CUSTOMERNAME") + '\n');           
                  }
                  out.println("i = " + i + '\n');

                  } catch (Exception e)
                  {
                    out.println("Exception : " + e.getMessage() + "");
                  }
%>

    
            <%-- To display selected value from dropdown list. --%>
     <% 
                String s=request.getParameter("item");
                if (s !=null)
                {
                    out.println("Selected Color is : "+s);
                }
      %>
            
            
        </div>
    </body>
</html>