# Open Trip Planner

Geographical server for computing trip routes and times, based on the open source library https://github.com/graphhopper/graphhopper

## Deployment

The project is currently deployed via an AWS code pipeline with the following build steps...

1) Run build.sh to import OSM and GTFs files. File cache is copied to an EFS which is then mounted to the docker container.
2) Build docker image
3) Deploy docker image on ECS

## Updating data

Make sure to update the data/version.txt when deploying new data, otherwise the data cached in EFS will continue to be used.

## Usage

The graphopper API documentation can be found here https://docs.graphhopper.com/

## Terms of Use

This specific code repository and all code within is © Crown copyright and available under the terms of the Open Government 3.0 licence.

The code has been developed and is maintained by the NHS and where possible we will try to adhere to the NHS Open Source Policy (<https://github.com/nhsx/open-source-policy/blob/main/open-source-policy.md>).

It shall remain free to the NHS and all UK public services.

Please note: This library relies on open source software which have their own licences and terms of use. Please review those licences prior to use.

### Contributions

This code has been authored by Luke Tinnion (luke.tinnion@nhs.net) and colleagues in the Digital Intelligence Unit @ NHS L&SC ICB.

_This project and all code within is © Crown copyright and available under the terms of the Open Government 3.0 licence._
