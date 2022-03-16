# Pokedex
El proyecto es una aplicación que está formada por la interacción de un administrador que carga la información y un usuario que la consume, en la cual, se podrán atrapar pokemones y visualizar la información particular de cada uno.

## Stack tecnológico
- Ruby 2.7.4
- Ruby on Rails 6.1.4.6
- PostgreSQL
- Node 14.15.5
- Action Mailer
- Active Storage - Cloudinary para las imágenes
- Sweet Alert 2
- Bootstrap 4
- Gemas:
	- Rubocop
	- Mjml-rails
	- Devise
	- Country select
	- Simple-form
	- Will paginate
	- Cloudinary
	- dotenv-rails
	- Better errors
	- Binding of caller
	- Pundit
	- Delayed job active record

## Instalación
Requerimientos
Antes de comenzar, se necesita instalar lo siguiente:
- Ruby version 2.7.4 para correr la aplicación
- Ruby on Rails  6.1.4.6 para correr la aplicación
- Node 14.15.5
- [Rubygems](http://rubygems.org/?locale=es "Rubygems") para conseguir todas las gemas
- dotenv-rails, groups: [:development, :test]
- [Git](http://git-scm.com/ "Git")
- Una base de datos como PostgreSQL
- Una api_key de Cloudinary
## Setup
1. Para conseguir el código, clone este repositorio
```
git clone git@github.com:SegundoRP/RAVN-RailsChallenge-V1.git
cd challenge_ravn_v1
```
2. Para instalar las gemas, correr el siguiente comando en el directorio del proyecto


    bundle install

3.Instalar los módulos de node


    yarn install
4.Crear una base de datos y correr las migraciones con los siguientes comandos


    rails db:create
    rails db:migrate
5.Una vez corrido el servidor, es necesario crearse una cuenta para poder visualizar el contenido de la aplicación ya que tiene la gema devise y setear un administrador ya que tiene permisos diferentes a las de un usuario

6.Para las fotos que son enviadas al correo y las de la aplicación, es necesario la api_key de Cloudinary, en el archivo .env colocar la api que tiene el siguiente formato


    CLOUDINARY_URL=cloudinary://298522699261255:Qa1ZfO4syfbOC-***********************8
