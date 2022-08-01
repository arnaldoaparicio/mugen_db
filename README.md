# README

This is the untitled MUGEN DB backend API. Created with Ruby on Rails.
This is a WIP and is currently in its very early development.

## What is MUGEN?
MUGEN is a 2d fighting game engine created by a company named Elecbyte. The purpose is for the user to create their own 2d fighting game. It is highly customizable, thus allowing the user to make changes to anything they desire. The sky is the limit.

## Why does this exist?
The purpose of this is to provide a large collection of links for the user to easily access assets for use with MUGEN. This includes characters, stages, screenpacks, lifebars, and other miscellaneous resources. Many of the databases that exist, past or present, are either defunct or severely out of date. The goal is to provide an up-to-date repository for everything involving MUGEN.

## AWS S3
This Rails API backend integrates Amazon S3 service to allow files to be uploaded, which is crucial to the purpose of this app.

## What's next to be done?
- Change table names
- Change names of some attributes in the tables
- Possibly change permissions on AWS bucket to allow "permanent" image urls
- Deploy to Heroku
- Implement more edge cases
- Create more tests
