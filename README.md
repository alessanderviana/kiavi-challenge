# How to use

## Prerequisites
* Docker Engine installed <br/>
* Docker Compose binaries installed <br/>

### Legend
a. **ENV:** Can be prod ou dev <br/>
b. **PORT:** 3000 (prod), 3001 (dev) <br/>

1. Clone the repo and get into the directory
```shell
git clone https://github.com/alessanderviana/kiavi-challenge.git
cd kiavi-challenge
```
 <br/>

2. Run the below commands <br/>
```shell
docker compose up -d --build
docker compose exec spina_[ENV] rails g spina:install
docker compose exec spina_[ENV] rails s -d -b 0.0.0.0
```
 <br/>

The build takes about 4 minutes to bring the two applications running (prod and dev). You should follow up the LOGs until you see the sentence: ***Created database 'spina_[ENVIRONMENT]'.***

The ***spina:install*** command is interactive. You must fill all the fields.

After the command ***'rails s'*** finish you should be able to access ***http://localhost:[PORT]*** and ***http://localahost:[PORT]/admin.***. Use the email and password you filled on interactive command.  <br/>  <br/>

The challenges:
---
  <br/>
1) Learn Ruby on Rails (the basic);  <br/>
2) How to dockerize a basic Ruby on Rails application;  <br/>
3) Do the same Docker image works in DEV and PROD;  <br/>
4) Install and configure Spina CMS to work in DEV and PROD;  <br/>
5) The 500 error found in Spina production environment (I couldn't solve it).  <br/>  <br/>

Attention points:
---
  <br/>
> - As an automation lover, I'd look for a way passing the spina's parameters automatically for a full automated build experience.  <b/>
> - I'd also think creating a pipeline to avoid writing commands to test and deploy the application.  <br/>  <br/>

References:
---
  <br/>
> https://guides.rubyonrails.org/getting_started.html  <br/>
> https://lipanski.com/posts/dockerfile-ruby-best-practices  <br/>
> https://semaphoreci.com/community/tutorials/dockerizing-a-ruby-on-rails-application  <br/>
> https://firehydrant.com/blog/developing-a-ruby-on-rails-app-with-docker-compose/  <br/>
> https://spinacms.com/docs/getting-started/installing-spina  <br/>
> https://www.matthewhoelter.com/2020/06/10/setup-spina-cms-with-ruby-on-rails-6-and-digital-ocean.html  <br/>
> https://medium.com/@gjcarew/dockerizing-a-rails-app-8ef739a19f8  <br/>
