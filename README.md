 
 
[![Build Status](https://travis-ci.org/rmcwilliam/PawPals.svg?branch=master)](http://travis-ci.org/rmcwilliam/PawPals)

 
# API 

##Overview

Welcome to the pawpals App API. The app allows users to register their pets and keep track of them via help from the user community and positional data. The following documentation will outline how all requests and responses will be handled.  


Data can be accessed from the [https://pawpals.herokuapp.com/]("https://pawpals.herokuapp.com/") domain. All requests and responses will formatted as JSON.


## Authentication Notes:

To make an authenticated request in any case other than registering a user or logging in you must supply an `Access-Token` as written in the header along with a valid long string of numbers and letters as the value. Otherwise, you'll receive a 401 Forbidden error.

`Example => ['Access-Token'] = '9f5b8ebf876121c3fc4c0fa18a511e16' `

##Table of Contents 
* [Users](#users)
     * [register a new user account](#register an account)
     * [delete a users account](#delete an account)
     * [login user](#logging in)
* [Pets](#pets)
    * [register a new pet](#register a pet)
    * [index of all users pets](#index of pets)
    * [show a single pet](#show single pet)
    * [index of pets for a particular user](#index of users pets)
    * [delete a pet](#delete a pet)
    * [update pet status and or picture](#update pet status and or picture)
* [Addresses](#addresses) 
    * [register a users address](#register an address)
    * [index of all users addresses](#index of all users addresses)
    * [show a specific address](#show single address)
    * [show a specific users address](#show particular users address)
    * [delete a users address](#delete an address)
    * [update a users address](#update address)
* [Pets Location](#pets location) 
    * [register a specific pets location](#register a pets location)
    * [show a specific pets most recent coordinates](#show a pets most recent coordinates)
    * [index of a specific pets coordinates](#index of a specific pets coordinates)
* [Pets GPS Location](#pets GPS location)
  * [show a specific pets most recent GPS coordinates](#show a pets most recent GPS coordinates)
  * [index of a specific pets GPS coordinates](#index of a specific pets GPS coordinates)

    
    
    
    
##<a name="users"></a>Users

##<a name="register an account"></a>Registering an Account

### POST `/signup`
#### Params:
`email:`  Email address as string, must be unique. `Password` A password as a string.

#### Response:
If the user was created successfully, you should receive status code 201 and ...

```json
{
  "user": {
    "user_id": 4,
    "email": "ryanmcwilliam@gmail.com",
    "access_token": "808a1fe0da2b04668d64b280396bf04f"
  }
}
```

If the user could not be created, you should receive status code 422 and ...

```json
{
    "errors": [
        "Email has already been taken"
       ]
}
```

##<a name="delete an account"></a>Delete an Account
### Delete `/signup`

#### Params:

`email:` User's email as a string. `password:` User's password as a string

#### Response:

If you successfully deleted the user's account, you should receive status code 200 and ...

```json
{
    "success:"[ 
        "Delete success!"
    ]
}
```

If the user's account could not be deleted, you should receive status code 401 and ...

```json
{
  "error": "Invalid email (rmcwilliam@gmail.com) or password."
}
```

##<a name="logging in"></a>Logging In
### `POST /login`

#### Params:

`email:` Email as string. `password:` Password as string.

#### Response:

Note: You will only receive the address if one has been entered for the user.

If the login was successful, you should receive status code 200 and ...


```json
{
  "user": {
    "id": 4,
    "email": "rmcwilliam@gmail.com",
    "access_token": "85ab3e7cd109cea45cd6cd81e44f6659",
    "address": {
      "id": 11,
      "user_id": 4,
      "address": "145 Space lane",
      "city": "smyrna",
      "state": "ga",
      "zip": 30080,
      "created_at": "2015-12-05T00:38:53.118Z",
      "updated_at": "2015-12-05T00:38:53.118Z",
      "latitude": 33.8806897,
      "longitude": -84.5064881
    }
  }
}
```

If the user could not be logged in, you should receive status code 401 and ...

```json
{"error": "Could not find user for rmcwilliam@gmail.com or wrong password."}
```

##<a name="pets"></a>Pets

##<a name="register a pet"></a>Register a Pet
### POST `/pets`

#### Params:
`name:` Must be given a name. `age:` Must enter an age. `breed:` Must provide breed, mutt, etc. `description:` Must provide a short description of the pet. 

#### Optional Params: 
`present:` State either yes or no in regards to the pet being lost or present(default => yes).  `picture:` Profile picture can be sent with pet registration. Accepted formats (gif, jpg, jpeg, png, jif, jfif). 

#### Response:
If the pet was created successfully, you should receive status code 201 and ...

```json
{
  "pet": {
    "user_id": 4,
    "pet_id": 10,
    "name": "biblo",
    "age": 8,
    "breed": "unsure",
    "description": "ugliest dog ever",
    "present": "yes",
    "picture": "http://s3.amazonaws.com/testing-pawpals/pets/avatars/000/000/010/original/2015-06-07_12.10.13.jpg?1449007823"
  }
}
```

#### Response without optional params:

```json
{
  "pet": {
    "user_id": 5,
    "pet_id": 12,
    "name": "fido",
    "age": 8,
    "breed": "grey hound",
    "description": "so cool",
    "present": "yes",
    "picture": "/avatars/original/missing.png"
  }
}
```

If the pet could not be created, you should receive status code 422 and ...

```json
{
  "errors": [
    "Name can't be blank",
    "Breed can't be blank",
    "Age can't be blank",
    "Description can't be blank"
  ]
}
```

##<a name="index of pets"></a>Index of Pets
### GET `/pets`

#### Params: none

Will return all users pets with their associated user id, pet id, name, breed, description and current status(present:).

#### Response: 
If the query was successful, you should receive status code 202 and ...

```json
{
  "pets": [
    {
      "user_id": 4,
      "pet_id": 1,
      "name": "Tex",
      "age": 12,
      "breed": "golden retriever ",
      "description": "cutest dog ever ",
      "present": "yes",
      "picture": "picture.jpg"
    },
    {
      "user_id": 4,
      "pet_id": 2,
      "name": "biblo",
      "age": 8,
      "breed": "unsure",
      "description": "ugliest dog ever",
      "present": "no",
      "picture": "picture.jpg"
    }
  ]
}
```

##<a name="show single pet"></a>Show Single Pet
### GET `/pets/:pet_id`

#### Params:
`pet_id:` Must provide the pets id to retrieve an individual pet.

#### Response:
If the query was successful, you should receive status code 202 and ...

```json
{
  "pet": {
    "user_id": 4,
    "pet_id": 1,
    "name": "Tex",
    "age": 12,
    "breed": "golden retriever ",
    "description": "cutest dog ever ",
    "present": "yes",
    "picture": "picture.jpg"
  }
}
```

##<a name="index of users pets"></a>Index of Users Pets
### GET `/users/:id/pets`

#### Params: 

`user_id:` Must provide the users id. 

Will return all of a specific users pets with their associated user id, pet id, name, breed, description and current status(present:).

#### Response: 
If the query was successful, you should receive status code 202 and ...

```json
{
  "pets": [
    {
      "user_id": 4,
      "pet_id": 1,
      "name": "Tex",
      "age": 12,
      "breed": "golden retriever ",
      "description": "cutest dog ever ",
      "present": "yes",
      "picture": "picture.jpg"
    },
    {
      "user_id": 4,
      "pet_id": 2,
      "name": "biblo",
      "age": 8,
      "breed": "unsure",
      "description": "ugliest dog ever",
      "present": "yes",
      "picture": "picture.jpg"
    }
  ]
}
```

##<a name="delete a pet"></a>Delete a Pet 
### DELETE `/pets/:pet_id`

#### Params:

`pet_id:` Must provide a pet id to delete individual pet.

#### Response:

If delete was successful, you should receive status code 202 and ...

```json
{"success:" "Pet delete successful!"}
```

If delete was unsuccessful, you should receive status code 401 and ...

```json
{
"Unable to delete the pet."
}
```

##<a name="update pet status and or picture"></a>Update Pet Status and or Picture
### PUT `/pets/:pet_id`

#### Params:

`pet_id:` Must provide a pet id to update an individual pets status(present:) and or picture. 

#### Optional Params:
`present:` yes or no(default => yes). `picture:` Optional profile picture can be sent with pet update. Accepted formats (gif, jpg, jpeg, png, jif, jfif).   


#### Response:

If update was successful, you should receive status code 202 and ...

```json
{
  "success": "Pet status and or picture update successful!"
}
```

If update was unsuccessful, you should receive status code 401 and ...

```json
{
"Unable to edit pets status and or picture."
}
```

##<a name="addresses"></a>Addresses

##<a name="register an address"></a>Register an Address
### POST `/addresses`

#### Params:
` street_address:` Must provide a street address like this(street_address) with underscore. `city:` Must provide a city. `state:` Must provide a state. `zip:` Must provide a zip code. 

#### Response:
Will include longitude and latitude calculated from the submitted address. If the address was created successfully, you should receive status code 201 and ...

```json
{
  "address": {
    "user_id": 3,
    "address_id": 12,
    "street_address": "167 Bear lane SE",
    "city": "smyrna",
    "state": "Ga",
    "zip": 30080,
    "longitude": -84.4707229,
    "latitude": 33.9284603
  }
}
```

If the address could not be created, you should receive status code 422 and ...

```json
{
  "errors": [
    "Street_address can't be blank",
    "City can't be blank",
    "Sate can't be blank",
    "Zip can't be blank",
    "Latitude can't be blank",
    "Longitude can't be blank"
  ]
}
```

##<a name="index of all users addresses"></a>Index of all Users Addresses
### GET `/addresses`

#### Params: none

Will return all users addresses with their associated `user id`, `address id`, `street_address`, `city`, `state`, `zip`, `latitude`, and `longitude`. 

#### Response: 

If query was successfully, you should receive status code 202 and ...

```json
{
  "addresses": [
    {
      "user_id": 3,
      "address_id": 10,
      "street_address": "123 Hello lane",
      "city": "smyrna",
      "state": "Ga",
      "zip": 30080,
      "latitude": 33.8806897,
      "longitude": -84.5064881
    },
    {
      "user_id": 4,
      "address_id": 11,
      "street_address": "145 Goodbye lane",
      "city": "smyrna",
      "state": "Ga",
      "zip": 30080,
      "latitude": 33.8806897,
      "longitude": -84.5064881
    },
    {
      "user_id": 5,
      "address_id": 12,
      "street_address": "167 Bear lane SE",
      "city": "smyrna",
      "state": "Ga",
      "zip": 30080,
      "latitude": 33.9284603,
      "longitude": -84.4707229
    }
  ]
}
```

##<a name="show single address"></a>Show Single Address
### GET `/addresses/:address_id`

#### Params:
`address_id:` Must provide the address id to retrieve an individual address.

#### Response:
If successful, you should receive status code 202 and ...

```json
{
  "address": {
    "user_id": 3,
    "address_id": 10,
    "street_address": "123 Raptor lane",
    "city": "smyrna",
    "state": "Ga",
    "zip": 30080,
    "latitude": 33.8806897,
    "longitude": -84.5064881
  }
}
```

##<a name ="show particular users address"></a>Show particular Users Address 
### GET `/users/:id/addresses`

#### Params: 

`user_id:` Must provide the users id. 

Will return a specific users address with it's `user id`, `address id`, `street_address`, `city`, `state`, `zip`, `latitude` and `longitude`.

#### Response: 

If query was successful, you should receive status code 202 and ...

```json
{
  "address": {
    "user_id": 3,
    "address_id": 10,
    "street_address": "678 TRex lane",
    "city": "smyrna",
    "state": "Ga",
    "zip": 30080,
    "latitude": 33.8806897,
    "longitude": -84.5064881
  }
}
```

##<a name="delete an address"></a>Delete an Address 
### DELETE `/addresses/:address_id`

#### Params:

`address_id:` Must provide an address id to delete an individual address.

#### Response:

If delete was successful, you should receive status code 202 and ...

```json
{"success:" "Address delete successful!"}
```

If delete was unsuccessful, you should receive status code 401 and ...

```json
{
"Unable to delete the Address."
}
```

##<a name="update address"></a>Update Address  
### PUT `/addresses/:address_id`

#### Params:

`address_id:` Must provide the address id. `street address:` Must provide a street address like this(street_address) with underscore. `city:` Must provide a city. `state:` Must provide a state. `zip:` Must provide a zip code. 

#### Response:

Latitude and Longitude will automatically be re-calculated based on updated address. If update was successful, you should receive status code 202 and ...

```json
{
  "address": {
    "user_id": 3,
    "address_id": 10,
    "street_address": "607 Too Cool drive",
    "city": "Smyrna",
    "state": "Ga",
    "zip": 33103,
    "longitude": -84.5064881,
    "latitude": 33.8806897
  }
}
```

If update was unsuccessful, you should receive status code 401 and ...

```json
{
"Unable to edit address."
}
```


##<a name="pets location"></a>Pets Location

##<a name="register a pets location"></a>Register a Pets Location 
### POST `/pet_notices/:pet_id`

#### Params:
` pet_id:` Must provide the pets id. `longitude:` Must provide longitude value. `latitude:` Must provide latitude value.

#### Response:
If the location parameters were created/saved successfully, you should receive status code 201 and ...

```json
{
  "pet_notice": {
    "pet_id": 1,
    "longitude": "34.67",
    "latitude": "74.567",
    "created_at": "2015-12-04T18:31:33.248Z"
  }
}
```

If the location parameters could not be created/stored, you should receive status code 422 and ...

```json
{
  "errors": [
    "Latitude can't be blank",
    "Longitude can't be blank"
  ]
}
```

##<a name="show a pets most recent coordinates"></a>Show a Pets Most Recent Coordinates 
### GET `/pet_notices/:pet_id`

#### Params:
`pet_id:` Must provide the pet id to retrieve the most recent individual set of coordinates for a particular pet.

#### Response:
If successful, you should receive status code 202 and ...

```json
{
  "pet_notice": {
    "pet_id": 1,
    "longitude": "34.67",
    "latitude": "74.567",
    "created_at": "2015-12-04T18:31:33.248Z"
  }
}
```

##<a name="index of a specific pets coordinates"></a>Index of a Specific Pets Coordinates 
### GET `/pet_notices/index/:pet_id`

#### Params: none

Will return all of a particular pets coordinates with their associated `pet id`, `longitude`, `latitude` and `created_at` fields.

#### Response: 

If query was successfully, you should receive status code 202 and ...

```json
{
  "pet_notices": [
    {
      "pet_id": 1,
      "longitude": "34.67",
      "latitude": "84.567",
      "created_at": "2015-12-04T18:30:37.950Z"
    },
    {
      "pet_id": 1,
      "longitude": "34.67",
      "latitude": "74.567",
      "created_at": "2015-12-04T18:30:55.469Z"
    },
    {
      "pet_id": 1,
      "longitude": "34.67",
      "latitude": "74.567",
      "created_at": "2015-12-04T18:31:33.248Z"
    }
  ]
}
```

##<a name="pets GPS location"></a>Pets GPS Location

##<a name="show a pets most recent GPS coordinates"></a>Show a Pets Most Recent GPS Coordinates 
### GET `/pet_checkins/:pet_id`

#### Params:
`pet_id:` Must provide the pet id to retrieve the most recent individual set of GPS coordinates for a particular pet.

Will return a specific pets most recent set of GPS coordinates with associated `pet id`, `longitude`, `latitude`, `adafruit_created_at` and `created_at` fields.

#### Response:
If the query was successful, you should receive status code 202 and ...

```json
{
  "pet_check_in": {
    "pet_id": 9,
    "longitude": 0,
    "latitude": 0,
    "adafruit_created_at": "2015-11-30T14:45:29.970Z",
    "created_at": "2015-12-11T01:23:25.623Z"
  }
}
```

##<a name="index of a specific pets GPS coordinates"></a>Index of a Specific Pets GPS Coordinates 
### GET `/pet_checkins/index/:pet_id`

#### Params: 
`pet_id:` Must provide the pet id to retrieve the most recent sets of GPS coordinates for a particular pet.

Will return 5 most recent sets of GPS coordinates with associated `pet id`, `longitude`, `latitude`, `adafruit_created_at` and `created_at` fields.

#### Response: 

If the query was successful, you should receive status code 202 and ...

```json
{
  "pet_check_ins": [
    {
      "pet_id": 9,
      "longitude": 0,
      "latitude": 0,
      "adafruit_created_at": "2015-11-30T14:46:19.772Z",
      "created_at": "2015-12-11T04:23:39.637Z"
    },
    {
      "pet_id": 9,
      "longitude": 0,
      "latitude": 0,
      "adafruit_created_at": "2015-11-30T14:46:11.053Z",
      "created_at": "2015-12-11T04:23:39.649Z"
    },
    {
      "pet_id": 9,
      "longitude": 0,
      "latitude": 0,
      "adafruit_created_at": "2015-11-30T14:45:38.691Z",
      "created_at": "2015-12-11T04:23:39.659Z"
    },
    {
      "pet_id": 9,
      "longitude": 0,
      "latitude": 0,
      "adafruit_created_at": "2015-11-30T14:45:29.970Z",
      "created_at": "2015-12-11T04:23:39.663Z"
    },
    {
      "pet_id": 9,
      "longitude": 0,
      "latitude": 0,
      "adafruit_created_at": "2015-11-30T14:44:55.768Z",
      "created_at": "2015-12-11T04:23:39.667Z"
    }
  ]
}
```