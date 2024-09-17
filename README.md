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
2. Run the below commands
```shell
docker compose up -d --build
docker compose exec spina_<ENV> rails g spina:install
docker compose exec spina_<ENV> rails s -d -b 0.0.0.0
```
<br/>
The build takes about 4 minutes to bring the two applications running (prod and dev). You should follow up the LOGs until you see the sentence: ***Created database 'spina_<ENVIRONMENT>'.***

The ***spina:install*** command is interactive. You must fill all the fields.

After the command ***'rails s'*** finish you should be able to access ***http://localhost:<PORT>*** and ***http://localahost:<PORT>/admin.***. Use the email and password you filled on interactive command.