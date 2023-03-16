## General info
# ExchangeRateProvider

The task is to implement an ExchangeRateProvider for Czech National Bank. Find data source on their web - part of the task is to find the source of the exchange rate data and a way how to extract it from there.

## Installation
```
bundle install
```

## Running Locally

To run the script locally, make sure you have Ruby 3.2.1 installed, then run:
```
ruby exchange_rates.rb <date>
```
Replace `<date>` with the date for which you want to fetch exchange rates.

The script will print the exchange rates for the specified date to the console.

## Running with Docker

To run the script inside a Docker container, make sure you have Docker and Docker Compose installed, then follow these steps:

1. Clone this repository to your local machine.
2. Navigate to the root directory of the project.
3. Build the Docker image by running:
```
    docker-compose build
```
4. Start the container by running and the script will run inside the container and output the exchange rates for the current date.
```
    docker-compose up
```
5. [OPTIONAL] The script will run inside the container and output the exchange rates for the selected date
```
    docker-compose run app ./exchange_rates.rb <date>
```
