<%@ page import="nl.captcha.Captcha" %>
    ...
    <% 
    
    Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
    
    String answer = request.getParameter("answer");
    if (captcha.isCorrect(answer)) { %>
        <b>Correct!</b>
    <% } 
    %>