<VirtualHost %ip%:%web_port%>

    ServerName %domain_idn%
    %alias_string%
    ServerAdmin %email%
    DocumentRoot %docroot%
    ScriptAlias /cgi-bin/ %home%/%user%/web/%domain%/cgi-bin/
    Alias /vstats/ %home%/%user%/web/%domain%/stats/
    Alias /error/ %home%/%user%/web/%domain%/document_errors/
    SuexecUserGroup %user% %group%
    CustomLog /var/log/httpd/domains/%domain%.bytes bytes
    CustomLog /var/log/httpd/domains/%domain%.log combined
    ErrorLog /var/log/httpd/domains/%domain%.error.log
    <Directory %docroot%>
        AllowOverride All
        Options +Includes -Indexes +ExecCGI
        Action phpcgi-script /cgi-bin/php
        <Files *.php>
            SetHandler phpcgi-script
        </Files>
    </Directory>
    <Directory %home%/%user%/web/%domain%/stats>
        AllowOverride All
    </Directory>
    IncludeOptional %home%/%user%/conf/web/httpd.%domain%.conf*

</VirtualHost>

