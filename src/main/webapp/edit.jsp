<%@page import="com.satishkrgupta.notetaker.entities.Note"%>
<%@page import="com.satishkrgupta.notetaker.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet">

        <title>Note Taker | Edit Note Page</title>
    </head>
    <body>
        
      <div class="container">
          <%@include file="navbar.jsp" %>
          <br>
          <h2>Edit Your Note : </h2>
          <br>
          
          <%
              int noteId = Integer.parseInt(request.getParameter("note_id").trim());
              Session s = FactoryProvider.getFactory().openSession();
              Note note = s.get(Note.class, noteId);
          %>
          
             <!--form-->
          <form action="UpdateServlet" method="post">
              
              <input value="<%= note.getId() %>" name="noteId" type="hidden"/>
              
            <div class="form-group">
              <label for="title">Note Title</label>
              <input required 
                     name="title"
                     type="text"
                     class="form-control"
                     id="title"
                     aria-describedby="emailHelp"
                     placeholder="Enter Here"
                     value="<%= note.getTitle() %>">
            </div>
            <div class="form-group">
              <label for="content">Note Content</label>
              <textarea required
                        name="content"
                        id="content"
                        placeholder="Enter your content here"
                        class="form-control"
                        style="height: 200px"><%= note.getContent() %>
              </textarea>
            </div>
              <div class="container text-center">
                <button type="submit" class="btn btn-success">Save Your Note</button>
            </div>
            
          </form>
             
      </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>