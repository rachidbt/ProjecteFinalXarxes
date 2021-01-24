<HTML>
<head>
    <title> PROJECTE ISP </title>
    <meta charset="UTF-8">
</head>
<body>
    <H2>Informacio</H2>
  <FORM ACTION="<?php echo $_SERVER["PHP_SELF"]?>" METHOD="GET">
        <b>Domini:</b>
        <INPUT TYPE="text" NAME="domini" id="domini" value="" >
        <br><b> Usuari:</b>
        <input type="text" name="usuari" id="usuari" value="" >
        <br><b> Contraseña:</b>
        <input type="text" name="contraseña" id="contraseña" value="" >
    <H2>Serveis</H2>
          <br><b>Base de dades:</b><br>
       <select name="base[]">
           <option value="mysql"  id="mysql" >Mysql</option>
           <option value="postgres" id="postgres" >Postgres</option>
       </select>
        <br><b>Mail:</b><br>
       <select name="mail[]">
           <option value="si"  id="mail_si" >SI</option>
           <option value="no"  id="mail_no" >NO</option>
       </select>
        <br><b>FTP:</b><br>
       <select name="ftp[]">
           <option value="si"  id="ftp_si" >SI</option>
           <option value="no"  id="ftp_no" >NO</option>
       </select>
       <br><b>WORDPRESS:</b><br>
       <select name="wordpress[]">
           <option value="si"  id="wordpress_si" >SI</option>
           <option value="no"  id="wordpress_no" >NO</option>
       </select>
            <br><b>HTTP:</b><br>
       <select name="ftp[]">
           <option value="si"  id="http_si" >SI</option>
           <option value="no"  id="http_no" >NO</option>
       </select>
      <br><br>
      <INPUT TYPE="submit" VALUE="Enviar">
    </FORM>
</body>
</HTML>
