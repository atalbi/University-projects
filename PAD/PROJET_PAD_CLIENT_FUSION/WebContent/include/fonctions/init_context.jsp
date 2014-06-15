<%@page import="java.util.Properties"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="admin.session.*" %>
<%@page import="recruteur.session.*"%>
<%@page import="candidat.session.*"%>
<%@page import="entity.*" %>
<%

        Properties props = new Properties();
        props.setProperty( "java.naming.factory.initial","org.jnp.interfaces.NamingContextFactory" );
        props.setProperty( "java.naming.provider.url", "127.0.0.1:1099" );
        props.setProperty( "java.naming.factory.url.pkgs", "org.jboss.naming" );
        final int nbElementTableau = 10; 
        Context context = null;
        try {
        	context = new InitialContext(props);
        	
        } 
        catch (NamingException e)
        {
         e.printStackTrace();
        }
         %>