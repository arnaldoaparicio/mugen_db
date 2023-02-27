# README

This is the untitled MUGEN DB backend API. Created with Ruby on Rails.

Server side of the backend is [here](https://mugen-db-be.fly.dev/api/v1/characters).

Please go [here](https://github.com/arnaldoaparicio/mugen_db_fe) if you would like to see the frontend of this project.


## What is MUGEN?
MUGEN is a 2d fighting game engine created by a company named Elecbyte. The purpose is for the user to create their own 2d fighting game. It is highly customizable, thus allowing the user to make changes to anything they desire. The sky is the limit.

## Why does this exist?
The purpose of this is to provide a large collection of links for the user to easily access assets for use with MUGEN. This includes characters, stages, screenpacks, lifebars, and other miscellaneous resources. Many of the databases that exist, past or present, are either defunct or severely out of date. The goal is to provide an up-to-date repository for everything involving MUGEN.

## Technical Goals
- Implement Amazon S3 to allow the uploading of files, specifically image files
- Generate a link to the file in the bucket to allow to display on the frontend

## Amazon S3
This uses Amazon S3 to handle file storage.

For more in-depth information regarding challenges and goals, check out this log I created: https://gist.github.com/arnaldoaparicio/c91ffdefd2573c21ba2c3c921760f8e1