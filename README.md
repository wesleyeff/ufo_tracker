# README

## Setup

### web application

- `docker-compose up`
- App will now be accessable at `localhost:3000`

### CLI Import tool

`ruby bin/import.rb filename.csv`

## Overview of process and technologies used

- I used ruby and rails to solve this programming challenge. 

- I started by designing my models and generating the necessary scaffolding to support the data. I then thought that sightings and hotspots should have a many-to-many relationship because a sighting could in theory be close to 2 hotspots. So I added the join table and update the relationship on the models. The basic CRUD operations exist on both objects. I was not able to make the relationship between models show in the api.

- For the cli import tool I wrote a ruby script and used the CSV library. I used `csv.foreach` to handle very large inputs and prevent memory issues. And I insert the rows directly into the database using raw sql.

## Database schema

### Hotspots

| Field      | Type         | Null | Key | Default | Extra          |
|------------|--------------|------|-----|---------|----------------|
| id         | bigint       | NO   | PRI | NULL    | auto_increment |
| name       | varchar(255) | YES  |     | NULL    |                |
| latitude   | float        | YES  |     | NULL    |                |
| longitude  | float        | YES  |     | NULL    |                |
| created_at | datetime(6)  | NO   |     | NULL    |                |
| updated_at | datetime(6)  | NO   |     | NULL    |                |

### Sightings

| Field            | Type        | Null | Key | Default | Extra          |
|------------------|-------------|------|-----|---------|----------------|
| id               | bigint      | NO   | PRI | NULL    | auto_increment |
| sighted_at       | text        | YES  |     | NULL    |                |
| latitude         | float       | YES  |     | NULL    |                |
| longitude        | float       | YES  |     | NULL    |                |
| shape            | text        | YES  |     | NULL    |                |
| duration_seconds | int         | YES  |     | NULL    |                |
| comments         | text        | YES  |     | NULL    |                |
| city             | text        | YES  |     | NULL    |                |
| state            | text        | YES  |     | NULL    |                |
| created_at       | datetime(6) | NO   |     | NULL    |                |
| updated_at       | datetime(6) | NO   |     | NULL    |                |

### Hotspots_sightings (join table)

| Field       | Type   | Null | Key | Default | Extra |
|-------------|--------|------|-----|---------|-------|
| hotspot_id  | bigint | NO   | MUL | NULL    |       |
| sighting_id | bigint | NO   | MUL | NULL    |       |

## challenges faces

- The biggest challenge I faced was getting up to speed on rails. Rails is much more implicit than web frameworks I'm used to and not knowing the conventions was my biggest hurdle.

- Using active record in the controller was challenging for me. After I made the many-to-many relationship, I couldn't get it to show in the api response body. However I could put logs in and see that the relationship existed on the objects after the db call.

## assumptions made

- I stored the sighted_at time as text in the db because of inconsistencies in the csv. I initially tried to parse the date out of the csv but was only able to successfully parse on about 1/3 of the rows.
- I assumed that the lat/long would be the final set of parens in the location field. I used that assumption to write my lat/long parser.


## next steps to finish

- Put more work into parsing the csv, especially lat/long. I would use regex to look for lat/long and then extract it to make that more rubust.
  - Work on parsing out the city/state as well.
- Logic comparing distances between hotspots and sightings and writing those relationships to the join table.
- Finish web api so that it returns all related objects on a query.
- CLI tool to export list of all hotspots and related sightings.
- Web app for managing hotspots
- Write tests

## feedback on challenge

- It was a really fun challenge. I like that there are a lot of requirements pertaining to different aspects of software engineering, including building the docker file to get everything running.
