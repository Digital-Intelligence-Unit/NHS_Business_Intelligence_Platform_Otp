# Open Trip Planner

Geographical server for computing trip routes and times, based on the open source library <https://www.opentripplanner.org/>

## Deployment

This code will deploy as a docker container and include the UK datasets we use to carry out geographical mapping functions.

For a method of automating the deployment of this server, along with the rest of our BI platform, please refer to: <https://github.com/morgans3/NHS_Business_Intelligence_Platform>

## Usage (API Calls)

There are far too many methods of using the server to include here. Guidance on all the API calls for this server can be found from the Open Trip Planner documentation.

An example of how to retrieve a FeatureCollection JSON response of the geometries of walking distance from the LatLng 53.74, -2.99 via an API call is:

<https://YOUR_URL_HERE/otp/routers/lsc/isochrone?fromPlace=53.74404,-2.99824&date=2022/04/28&time=12:00:00&maxWalkDistance=1000&mode=WALK&cutoffSec=1800&cutoffSec=3600>

The routerID set in the Dockerfile in `lsc`.

## Terms of Use

This specific code repository and all code within is © Crown copyright and available under the terms of the Open Government 3.0 licence.

The code has been developed and is maintained by the NHS and where possible we will try to adhere to the NHS Open Source Policy (<https://github.com/nhsx/open-source-policy/blob/main/open-source-policy.md>).

It shall remain free to the NHS and all UK public services.

Please note: This library relies on open source software which have their own licences and terms of use. Please review those licences prior to use.

### Contributions

This code has been authored by Stewart Morgan (stewart.morgan@nhs.net) and colleagues in the Digital Intelligence Unit @ NHS Blackpool CCG.

_This project and all code within is © Crown copyright and available under the terms of the Open Government 3.0 licence._
