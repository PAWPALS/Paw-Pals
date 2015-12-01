# API 

##Overview
Data can be accessed from the "https://pawpals.herokuapp.com/" domain. All requests and responses will formatted as JSON.


## Authentication Notes:

To make an authenticated request in any case other than registering
or deleting an account, you must supply an `Access-Token` as written in the header along with a valid long string of numbers and letters as the value. Otherwise, you'll receive a 401 Forbidden error.

`Example => ['Access-Token'] = '9f5b8ebf876121c3fc4c0fa18a511e16' `

## Registering an Account

### POST `/signup`
#### Params:
`email:` Email address must be unique. `Password:` A password.

#### Response:
If the user was created successfully, you should receive status code 201 and ...

`{
  "user": {
    "user_id": 4,
    "email": "ryanmcwilliam@gmail.com",
    "access_token": "808a1fe0da2b04668d64b280396bf04f"
  }
}`

If the user could not be created, you should receive status code 422 and ...

`{
    "errors": [
        "Email has already been taken"
       ]
}`

## Deleting an Account
### Delete `/signup`

#### Params:

`email:` User's email. `password:` User's password

#### Response:

If you successfully deleted the user's account, you should receive status code 200 and ...

`{
    success:[ 
        "Delete success!"
    ]
}`

If the user's account could not be deleted, you should receive status code 401 and ...

`{
  "error": "Invalid email (rmcwilliam@gmail.com) or password."
}`

## Logging In
### `POST /login`

#### Params:

`email:` Email as string. `password:` Password as string.

#### Response:
If the login was successful, you should receive status code 200 and ...

`{
  "user": {
    "email": "ryanmcwilliam@gmail.com",
    "access_token": "7b35e48054cf6c749714f30f3f7c897c"
  }
}`

If the user could not be logged in, you should receive status code 401 and ...

`{"error": "Could not find user for rmcwilliam@gmail.com or wrong password."}`

## Register a Pet
### POST `/pets`

#### Params:
`name:` Must be given a name. `age:` Must enter an age. `breed:` Must provide breed, mutt, etc. `description:` Must provide a short description of the pet. `present:` Must state either true or false in regards to the pet being lost or present. `picture:` Optional profile picture can be sent with pet registration. Accepted formats (gif, jpg, jpeg, png, jif, jfif). 

#### Response:
If the pet was created successfully, you should receive status code 201 and ...

`{
  "pet": {
    "user_id": 4,
    "pet_id": 10,
    "name": "biblo",
    "age": 8,
    "breed": "unsure",
    "description": "ugliest dog ever",
    "present": true,
    "picture": "http://s3.amazonaws.com/testing-pawpals/pets/avatars/000/000/010/original/2015-06-07_12.10.13.jpg?1449007823"
  }
}`

If the pet could not be created, you should receive status code 422 and ...

`{
  "errors": [
    "Name can't be blank",
    "Breed can't be blank",
    "Age can't be blank",
    "Description can't be blank",
    "Present can't be blank"
  ]
}`


## Index of Pets
### GET `/pets`

#### Params: none

Will return all users pets with their associated user id, pet id, name, breed, description and current status.

#### Response: 
If query was successfully, you should receive status code 202 and ...

`{
  "pets": [
    {
      "user_id": 4,
      "pet_id": 1,
      "name": "Tex",
      "age": 12,
      "breed": "golden retriever ",
      "description": "cutest dog ever ",
      "present": true
    },
    {
      "user_id": 4,
      "pet_id": 2,
      "name": "biblo",
      "age": 8,
      "breed": "unsure",
      "description": "ugliest dog ever",
      "present": true
    }
  ]
}`

## Show Single Pet
### GET `/pets/:pet_id`

#### Params:
`pet_id:` Must provide the pets id to retrieve an individual pet.

#### Response:
If successfully, you should receive status code 202 and ...

`{
  "pet": {
    "user_id": 4,
    "pet_id": 1,
    "name": "Tex",
    "age": 12,
    "breed": "golden retriever ",
    "description": "cutest dog ever ",
    "present": true
  }
}`

## Index of Users Pets
### GET `/users/:id/pets`

#### Params: 

`user_id:` Must provide the users id. 

Will return all of a specific users pets with their associated user id, pet id, name, breed, description and current status.

#### Response: 
If query was successful, you should receive status code 202 and ...

`{
  "pets": [
    {
      "user_id": 4,
      "pet_id": 1,
      "name": "Tex",
      "age": 12,
      "breed": "golden retriever ",
      "description": "cutest dog ever ",
      "present": true
    },
    {
      "user_id": 4,
      "pet_id": 2,
      "name": "biblo",
      "age": 8,
      "breed": "unsure",
      "description": "ugliest dog ever",
      "present": true
    }
  ]
}`


## Delete a Pet 
### DELETE `/pets/:pet_id`

#### Params:

`pet_id:` Must provide a pet id to delete individual pet.

#### Response:

If delete was successful, you should receive status code 202 and ...

`{success: "Pet delete successful!"}`

If delete was unsuccessful, you should receive status code 401 and ...

`{
"Unable to delete the pet."
}`

## Update Pet Status and or Picture
 
### PUT `/pets/:pet_id`

#### Params:

`pet_id:` Must provide a deck id to update an individual deck. `present:` True or False. `picture:` Optional profile picture can be sent with pet update. Accepted formats (gif, jpg, jpeg, png, jif, jfif).   


#### Response:

If update was successful, you should receive status code 202 and ...

`{
  "success": "Pet status and or picture update successful!"
}`

If update was unsuccessful, you should receive status code 401 and ...


`{
"Unable to edit pets status and or picture."
}`




