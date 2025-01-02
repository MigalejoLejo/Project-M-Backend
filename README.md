
<H1>Project-M: Backend</H1>
With this project I am challenging myself to create a fullstack application using techniques and technologies I haven´t use a lot until now.

If you want you can take a look at the end product here:
-> Link pending 

or clone this project and run it in your system. In that case you need to follow the setup instructions:

<H2>The Setup</H2>

In the backend we have an API-Service created with python, postgres and Keycloak.

To run this project you may need to first some environment variables. Just create a .env file in the root of the project and fill in the empty values with the values you prefer:

>DB_HOST=database </br>
>DB_PORT=5432  </br>
>DB_NAME=api_database  </br>
><span style="color:orange">DB_USER=  </br>
>DB_PASSWORD=  </br> </span>
>
>C_DB_NAME=kc_database  </br>
>KC_DB_USER=kc_admin  </br>
>KC_DB_PASSWORD=simba25!  </br>
><span style="color:orange">KEYCLOAK_ADMIN=  </br>
>KEYCLOAK_ADMIN_PASSWORD=  </br> </span>

after that run

> docker-compose up

This will set up a container for Python, Keycloack and two Databases accordingly.




