#!/bin/bash


#IMPORTAR BASES DATOS DB_examples/mongodb


# Descomentar para clonar
#git clone https://github.com/grafenocarbono/DB_examples


#Cambiar por la ruta donde se haya descargado
cd
cd Downloads/DB_examples/mongodb/  


cd sample_airbnb
mongoimport --db airbnb --collection listingsAndReviews --file listingsAndReviews.json 
cd ..


cd sample_analytics
mongoimport --db analytics --collection accounts --file accounts.json
mongoimport --db analytics --collection customers --file customers.json
mongoimport --db analytics --collection transactions --file transactions.json 
cd ..


cd sample_geospatial
mongoimport --db geospatial --collection shipwrecks --file shipwrecks.json
cd ..


cd sample_mflix
mongoimport --db mflix --collection comments --file comments.json 
mongoimport --db mflix --collection movies --file movies.json 
mongoimport --db mflix --collection theaters --file theaters.json 
mongoimport --db mflix --collection users --file users.json
cd ..


cd sample_supplies
mongoimport --db supplies --collection sales --file sales.json
cd ..


cd sample_training
mongoimport --db training --collection companies --file companies.json
mongoimport --db training --collection inspections --file inspections.json
mongoimport --db training --collection routes --file routes.json
mongoimport --db training --collection trips --file trips.json
mongoimport --db training --collection zips --file zips.json
mongoimport --db training --collection grades --file grades.json
mongoimport --db training --collection posts --file posts.json
mongoimport --db training --collection stories --file stories.json
mongoimport --db training --collection tweets --file tweets.json
cd ..


cd sample_weatherdata
mongoimport --db weatherdata --collection data --file data.json


echo "Author: Gelo Coline, Yohanna"
