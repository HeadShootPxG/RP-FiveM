# RP-FiveM


### JobList
	
	*Ambulance - Ambulance
	*Bahama - Bahama
	*Banque - Banker
	*Avocat - Lawyer
	*Mécano - mechanic
	*Police - LSPD
	*Eboueur - Garbage
	*Président - President
	*Agent immobilier - Real estate agent
	*Taxi - Taxi
	*Unicorn - Unicorn
	*Concessionnaire * CarDealer
	*Vigneron - Vigneron

* Requirements :

	* [Mysql-async](https://github.com/brouznouf/fivem-mysql-async)
	* [Async](https://github.com/ESX-Org/async)
	* [Essentialmode](https://github.com/kanersps/essentialmode/releases/tag/6.1.0)
	* [esplugin_mysql](https://github.com/kanersps/esplugin_mysql)
	* [es_admin2](https://github.com/kanersps/es_admin)
	* [es_extended](https://github.com/ESX-Org/es_extended)
	* [skinchanger](https://github.com/ESX-Org/skinchanger)
	* [esx_skin](https://github.com/ESX-Org/esx_skin)
	* [esx_addonaccout](https://github.com/ESX-Org/esx_addonaccount)
	* [esx_jobs](https://github.com/ESX-Org/esx_jobs)
	* [esx_joblisting](https://github.com/ESX-Org/esx_joblisting)

## Installation
- Import `RP-FiveM.sql` in your database
- Add this in your server.cfg :

```
### MYSQL ASYNC ###
	start mysql-async
	start async
	
### ES_EXTENDED ###
	start essentialmode
	start esplugin_mysql
    start es_admin2
    start es_extended

### ESX_REQUIRED MODS ###
	start instance
    start cron
    start skinchanger
    start esx_skin
    start esx_addonaccount
    start esx_addoninventory
    start esx_datastore    
    start esx_society
    start esx_service
    start esx_billing

### ESX_JOBS ###
 	start esx_jobs
    start esx_joblisting
    start esx_taxijob
    start esx_mecanojob
    start esx_policejob
    start esx_property
    start esx_realestateagentjob
    start esx_bankerjob
    start esx_ambulancejob
    start esx_vehicleshop
    start esx_vigneronjob
    start esx_president
    start esx_poubelle
    start esx_unicornjob
    start bahamajob
    start esx_lawyerjob

```

New Update Soon
